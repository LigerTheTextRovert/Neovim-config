return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
		"b0o/schemastore.nvim", -- for jsonls
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")

		-- diagnostic signs
		local signs = { Error = " ", Warn = " ", Hint = "󰌵", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = { source = true, spacing = 2, prefix = "●" },
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		local diagnostic_virtual_text = true
		vim.keymap.set("n", "<leader>tv", function()
			diagnostic_virtual_text = not diagnostic_virtual_text
			vim.diagnostic.config({ virtual_text = diagnostic_virtual_text })
			print("Virtual Text: " .. (diagnostic_virtual_text and "ON" or "OFF"))
		end, { desc = "Toggle virtual text" })

		-- shared on_attach
		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("FormatOnSave_" .. bufnr, { clear = true }),
					buffer = bufnr,
					callback = vim.lsp.buf.format,
				})
			end
		end

		-- Global LSP keymaps (applied on LspAttach)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				-- feel free to add more: gd, gr, ca, <leader>ca, etc.
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- lua
		require("neodev").setup({})
		vim.lsp.config("lua_ls", {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
		})

		-- vtsls (typescript/javascript)
		vim.lsp.config("vtsls", {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				typescript = {
					preferences = {
						importModuleSpecifier = "relative",
						includeCompletionsForModuleExports = true,
					},
					suggest = { completeFunctionCalls = true },
				},
			},
		})

		-- tailwindcss
		vim.lsp.config("tailwindcss", {
			on_attach = on_attach,
			capabilities = capabilities,
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
					experimental = {
						classRegex = {
							{ "tw`([^`]*)`", "1" },
							{ 'tw="([^"]*)"', "1" },
							{ "tw%(([^)]*)%)", "1" },
						},
					},
				},
			},
			root_dir = require("lspconfig.util").root_pattern(
				"tailwind.config.js",
				"tailwind.config.cjs",
				"tailwind.config.ts",
				"postcss.config.js",
				"package.json",
				".git"
			),
		})

		-- jsonls + schemastore
		vim.lsp.config("jsonls", {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})

		-- pyright
		vim.lsp.config("pyright", {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				python = {
					pythonPath = vim.fn.getcwd() .. "/venv/bin/python", -- consider using a venv selector instead
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
					},
				},
			},
		})

		-- gopls
		vim.lsp.config("gopls", {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				gopls = {
					analyses = { unusedparams = true },
					staticcheck = true,
					codelenses = {
						generate = true,
						gc_details = true,
						test = true,
						tidy = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					completeUnimported = true,
					completeFunctionCalls = false,
					usePlaceholders = false,
					semanticTokens = true,
				},
			},
		})

		vim.lsp.enable({ "lua_ls", "vtsls", "tailwindcss", "jsonls", "pyright", "gopls" })

		-- Optional: If you want mason-lspconfig to auto-install them (and potentially auto-enable others later)
		-- mason_lspconfig.setup({
		--   ensure_installed = { "lua_ls", "vtsls", "tailwindcss", "jsonls", "pyright", "gopls" },
		--   -- automatic_enable = true,  -- uncomment if you add more servers later without vim.lsp.config()
		-- })
	end,
}
