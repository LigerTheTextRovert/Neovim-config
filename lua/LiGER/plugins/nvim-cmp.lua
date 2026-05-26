return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		-- VSCode-like highlight groups
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#569cd6", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#569cd6", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9cdcfe" })
		vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#9cdcfe" })
		vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#9cdcfe" })
		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#c586c0" })
		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#c586c0" })
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#d4d4d4" })
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#d4d4d4" })
		vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#d4d4d4" })
		vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#ce9178" })
		vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#4ec9b0" })
		vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#4ec9b0" })
		vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#606060", italic = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#606060", strikethrough = true })

		cmp.setup({
			window = {
				-- completion = {
				-- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				-- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
				-- scrollbar = false,
				-- col_offset = -3,
				-- side_padding = 2,
				-- },
				-- documentation = {
				-- 	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				-- 	winhighlight = "Normal:CmpDoc",
				-- },
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				-- tab through snippet nodes
				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 750 },
				{ name = "buffer", priority = 500, keyword_length = 3 },
				{ name = "path", priority = 250 },
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
					})(entry, vim_item)

					-- VSCode-style: split icon and text into separate columns
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "  " .. (strings[2] or "") .. " "

					return kind
				end,
			},
			-- sort: exact matches first, then by LSP score
			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})

		-- SCSS filetype override
		cmp.setup.filetype("scss", {
			sources = cmp.config.sources({
				{
					name = "luasnip",
					priority = 750,
					entry_filter = function(entry)
						local text = entry:get_insert_text()
						if text and text:match("%${%d+") then
							return false
						end
						return true
					end,
				},
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "buffer", priority = 500 },
				{ name = "path", priority = 250 },
			}),
		})
	end,
}
