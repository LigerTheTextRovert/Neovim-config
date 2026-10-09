return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		"b0o/schemastore.nvim", -- for jsonls
	},
	config = function()
		-- Diagnostic signs
		local signs = { Error = "E ", Warn = "W ", Hint = "H", Info = "I " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = { source = "if_many", spacing = 2, prefix = "●", max_width = 80, max_height = 20 },
			float = { border = "rounded", source = true, wrap_at = 80 },
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
			config = config or {}
			config.border = "rounded"
			return vim.lsp.handlers.hover(_, result, ctx, config)
		end
		vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, config)
			config = config or {}
			config.border = "rounded"
			return vim.lsp.handlers.signature_help(_, result, ctx, config)
		end

		local diagnostic_virtual_text = true
		vim.keymap.set("n", "<leader>tv", function()
			diagnostic_virtual_text = not diagnostic_virtual_text
			vim.diagnostic.config({ virtual_text = diagnostic_virtual_text })
			print("Virtual Text: " .. (diagnostic_virtual_text and "ON" or "OFF"))
		end, { desc = "Toggle virtual text" })

		local function get_python_path(workspace)
			local active_venv = os.getenv("VIRTUAL_ENV")
			if active_venv then
				return active_venv .. "/bin/python"
			end

			for _, pattern in ipairs({ "/.venv/bin/python", "/venv/bin/python" }) do
				local python = workspace .. pattern
				if vim.fn.executable(python) == 1 then
					return python
				end
			end

			return "python3"
		end

		-- Shared on_attach. Formatting is intentionally left to conform.nvim so one
		-- tool owns format-on-save and LSP servers do not fight external formatters.
		local on_attach = function(client, bufnr)
			if client.server_capabilities.semanticTokensProvider then
				client.server_capabilities.semanticTokensProvider = nil
			end
			if client.supports_method("textDocument/codeLens") then
				local group = vim.api.nvim_create_augroup("LspCodeLens_" .. bufnr, { clear = true })
				vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold" }, {
					group = group,
					buffer = bufnr,
					callback = vim.lsp.codelens.refresh,
				})
				vim.lsp.codelens.refresh()
			end
		end

		-- Global LSP keymaps (applied on LspAttach)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				-- feel free to add more: gd, gr, ca, <leader>ca, etc.
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local function setup(server, opts)
			opts = opts or {}
			opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
			opts.on_attach = opts.on_attach or on_attach
			vim.lsp.config(server, opts)
		end

		setup("lua_ls", {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					completion = { callSnippet = "Replace" },
					telemetry = { enable = false },
				},
			},
		})

		setup("vtsls", {
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
			settings = {
				vtsls = {
					autoUseWorkspaceTsdk = true,
					experimental = {
						completion = {
							enableServerSideFuzzyMatch = true,
						},
					},
				},
				typescript = {
					preferences = {
						importModuleSpecifier = "relative",
						includeCompletionsForModuleExports = true,
						includeCompletionsForImportStatements = true,
						includePackageJsonAutoImports = "on",
						quoteStyle = "single",
					},
					suggest = {
						completeFunctionCalls = true,
						autoImports = true,
					},
				},
				javascript = {
					preferences = {
						importModuleSpecifier = "relative",
						includeCompletionsForModuleExports = true,
						includeCompletionsForImportStatements = true,
						includePackageJsonAutoImports = "on",
						quoteStyle = "single",
					},
					suggest = {
						completeFunctionCalls = true,
						autoImports = true,
					},
				},
			},
		})

		setup("tailwindcss", {
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
				"vue",
				"php",
				"eelixir",
				"eruby",
			},
			init_options = {
				userLanguages = { eelixir = "html", eruby = "html", php = "html" },
			},
			settings = {
				tailwindCSS = {
					classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
					experimental = {
						classRegex = {
							{ "tw`([^`]*)`", "1" },
							{ 'tw="([^"]*)"', "1" },
							{ "tw%(([^)]*)%)", "1" },
						},
					},
				},
			},
		})

		setup("jsonls", {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})

		setup("pyright", {
			before_init = function(_, config)
				config.settings.python.pythonPath = get_python_path(config.root_dir or vim.fn.getcwd())
			end,
			settings = {
				python = {
					pythonPath = "python3",
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
						typeCheckingMode = "basic",
					},
				},
			},
		})

		setup("emmet_ls", {
			filetypes = {
				"html",
				"css",
				"scss",
				"javascriptreact",
				"typescriptreact",
			},
		})

		setup("gopls", {
			settings = {
				gopls = {
					analyses = { unusedparams = true, shadow = true },
					staticcheck = true,
					codelenses = {
						generate = true,
						gc_details = true,
						test = true,
						tidy = true,
					},
					-- hints = {
					-- 	assignVariableTypes = true,
					-- 	compositeLiteralFields = true,
					-- 	compositeLiteralTypes = true,
					-- 	constantValues = true,
					-- 	functionTypeParameters = true,
					-- 	parameterNames = true,
					-- 	rangeVariableTypes = true,
					-- },
					completeUnimported = true,
					completeFunctionCalls = false,
					usePlaceholders = false,
					semanticTokens = true,
				},
			},
		})

		setup("cssls")
		setup("somesass_ls")
		setup("clangd", {
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--completion-style=detailed",
				"--header-insertion=iwyu",
				"--function-arg-placeholders",
			},
			init_options = {
				clangdFileStatus = true,
				usePlaceholders = true,
				completeUnimported = true,
			},
		})
		setup("rust_analyzer", {
			settings = {
				["rust-analyzer"] = {
					cargo = { allFeatures = true },
					check = { command = "clippy" },
				},
			},
		})
		setup("eslint", {
			settings = {
				workingDirectory = { mode = "auto" },
			},
		})

		vim.lsp.enable({
			"lua_ls",
			"vtsls",
			"tailwindcss",
			"jsonls",
			"pyright",
			"gopls",
			"emmet_ls",
			"cssls",
			"somesass_ls",
			"clangd",
			"rust_analyzer",
			"eslint",
		})
	end,
}
