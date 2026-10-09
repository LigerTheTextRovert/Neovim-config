return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	branch = "main",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter").setup()

		-- Install parsers
		require("nvim-treesitter").install({
			"json",
			"javascript",
			"jsdoc",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"go",
			"vim",
			"dockerfile",
			"gitignore",
			"scss",
			"query",
			"vimdoc",
			"python",
			"rust",
			"sql",
			"c",
		})

		-- Enable treesitter highlighting globally (built into Neovim 0.12+)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})

		-- Setup autotag directly
		require("nvim-ts-autotag").setup({
			enable = true,
		})
	end,
}
