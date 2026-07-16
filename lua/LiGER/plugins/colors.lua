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

return {
	"bluz71/vim-nightfly-colors",
	name = "nightfly",
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.termguicolors = true
		vim.g.nightflyTransparent = true
		vim.cmd([[colorscheme nightfly]])
		vim.cmd([[highlight WinSeparator guibg=none guifg=#3e4451]])
	end,
}

-- return {
-- 	"dgox16/oldworld.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("oldworld")
-- 	end,
-- }
