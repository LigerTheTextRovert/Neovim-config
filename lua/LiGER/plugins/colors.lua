-- return {
-- 	"Mofiqul/vscode.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		-- local c = require("vscode.colors").get_colors()
-- 		require("vscode").setup({
-- 			transparent = true,
-- 			disable_nvimtree_bg = false,
-- 		})
-- 		vim.cmd([[colorscheme vscode]])
-- 		vim.cmd([[highlight WinSeparator guibg=none guifg=#3e4451]])
-- 	end,
-- }

-- return {
-- 	"bluz71/vim-nightfly-colors",
-- 	name = "nightfly",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.o.termguicolors = true
-- 		vim.g.nightflyTransparent = true
-- 		vim.cmd([[colorscheme nightfly]])
-- 		vim.cmd([[highlight WinSeparator guibg=none guifg=#3e4451]])
-- 	end,
-- }

return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("kanagawa").setup({
			compile = false,
			undercurl = true,
			commentStyle = {},
			functionStyle = {},
			keywordStyle = {},
			statementStyle = {},
			typeStyle = {},
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			colors = {
				palette = {},
				theme = {
					wave = {},
					lotus = {},
					dragon = {},
					all = {},
				},
			},
			overrides = function(colors)
				return {
					SignColumn = { bg = "NONE" },
					LineNr = { bg = "NONE" },
					-- Git signs
					GitSignsAdd = { fg = "#76946A", bg = "NONE" }, -- green
					GitSignsChange = { fg = "#DCA561", bg = "NONE" }, -- yellow/orange
					GitSignsDelete = { fg = "#C34043", bg = "NONE" }, -- red
					-- Optional
					GitSignsChangedelete = { fg = "#DCA561", bg = "NONE" },
					GitSignsTopdelete = { fg = "#C34043", bg = "NONE" },
					GitSignsUntracked = { fg = "#76946A", bg = "NONE" },
				}
			end,
			theme = "wave",
			background = {
				dark = "wave",
				light = "lotus",
			},
		})
		vim.cmd("colorscheme kanagawa")
		vim.cmd([[highlight WinSeparator guibg=#313640 guifg=#3e4451]])
	end,
}
