return {
	"Mofiqul/vscode.nvim",
	priority = 1000,
	config = function()
		-- local c = require("vscode.colors").get_colors()
		require("vscode").setup({
			transparent = true,
			disable_nvimtree_bg = false,
		})
		vim.cmd([[colorscheme vscode]])
		vim.cmd([[highlight WinSeparator guibg=#3e4451 guifg=NONE]])
	end,
}

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

-- return {
-- 	"craftzdog/solarized-osaka.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("solarized-osaka").setup({
-- 			transparent = false,
-- 		})
--
-- 		vim.cmd.colorscheme("solarized-osaka")
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
-- 	end,
-- }
