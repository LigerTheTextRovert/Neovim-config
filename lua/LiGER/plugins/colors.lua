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
-- 	"nickkadutskyi/jb.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		require("jb").setup({ transparent = true })
-- 		vim.cmd("colorscheme jb")
-- 	end,
-- }

return {
	"bluz71/vim-nightfly-colors",
	name = "nightfly",
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.termguicolors = true
		vim.g.nightflyTransparent = true
		vim.cmd([[colorscheme nightfly]])
	end,
}

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "auto", -- auto, main, moon, or dawn
-- 			dark_variant = "main", -- main, moon, or dawn
-- 			dim_inactive_windows = false,
-- 			extend_background_behind_borders = true,
--
-- 			styles = {
-- 				bold = false,
-- 				italic = false,
-- 				transparency = true,
-- 			},
--
-- 			groups = {
-- 				border = "muted",
-- 				link = "iris",
-- 				panel = "surface",
--
-- 				error = "love",
-- 				hint = "iris",
-- 				info = "foam",
-- 				note = "pine",
-- 				todo = "rose",
-- 				warn = "gold",
--
-- 				git_add = "foam",
-- 				git_change = "rose",
-- 				git_delete = "love",
-- 				git_dirty = "rose",
-- 				git_ignore = "muted",
-- 				git_merge = "iris",
-- 				git_rename = "pine",
-- 				git_stage = "iris",
-- 				git_text = "rose",
-- 				git_untracked = "subtle",
--
-- 				h1 = "iris",
-- 				h2 = "foam",
-- 				h3 = "rose",
-- 				h4 = "gold",
-- 				h5 = "pine",
-- 				h6 = "foam",
-- 			},
-- 		})
--
-- 		vim.cmd("colorscheme rose-pine")
-- 		-- vim.cmd("colorscheme rose-pine-main")
-- 		-- vim.cmd("colorscheme rose-pine-moon")
-- 		-- vim.cmd("colorscheme rose-pine-dawn")
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }
