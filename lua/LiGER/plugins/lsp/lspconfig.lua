return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local protocol = require("vim.lsp.protocol")
		local keymap = vim.keymap
		local diagnostic_virtual_text = true -- initial state

		-- Global diagnostic settings
		vim.diagnostic.config({
			virtual_text = {
				spacing = 2,
				prefix = "●",
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- Toggle virtual text with <leader>tv
		keymap.set("n", "<leader>tv", function()
			diagnostic_virtual_text = not diagnostic_virtual_text
			vim.diagnostic.config({ virtual_text = diagnostic_virtual_text })
			print("Virtual Text: " .. (diagnostic_virtual_text and "ON" or "OFF"))
		end, { desc = "Toggle virtual text" })

		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("Format", { clear = true }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup_handlers({
			function(server)
				nvim_lsp[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,

			-- Lua LSP with Neovim-specific setup
			["lua_ls"] = function()
				require("neodev").setup({})
				nvim_lsp["lua_ls"].setup({
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
			end,

			-- Custom servers
			["ts_ls"] = function()
				nvim_lsp["ts_ls"].setup({ on_attach = on_attach, capabilities = capabilities })
			end,
			["cssls"] = function()
				nvim_lsp["cssls"].setup({ on_attach = on_attach, capabilities = capabilities })
			end,
			["tailwindcss"] = function()
				nvim_lsp["tailwindcss"].setup({ on_attach = on_attach, capabilities = capabilities })
			end,
			["html"] = function()
				nvim_lsp["html"].setup({ on_attach = on_attach, capabilities = capabilities })
			end,
			["jsonls"] = function()
				nvim_lsp["jsonls"].setup({ on_attach = on_attach, capabilities = capabilities })
			end,
			["clangd"] = function()
				nvim_lsp["clangd"].setup({ on_attach = on_attach, capabilities = capabilities })
			end,
			["eslint"] = function()
				nvim_lsp["eslint"].setup({ on_attach = on_attach, capabilities = capabilities })
			end,
			["pyright"] = function()
				nvim_lsp["pyright"].setup({ on_attach = on_attach, capabilities = capabilities })
			end,
		})
	end,
}
