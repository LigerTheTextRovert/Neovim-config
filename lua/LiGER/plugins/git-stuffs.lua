return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>")
			vim.keymap.set("n", "<leader>hp", ":Gitsigns toggle_current_line_blame<CR>")
		end,
	},
}
