return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			-- Enable auto-installation of parsers
			auto_install = true,

			-- Keep your existing highlight config
			highlight = {
				enable = true,
			},

			indent = { enable = true },

			-- IMPORTANT: Add these for better integration
			autotag = {
				enable = true,
			},

			-- Your parser list is fine
			ensure_installed = {
				"json",
				"javascript",
				"jsdoc",
				"typescript",
				"tsx",
				"jsx",
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
				"c",
			},
		})
	end,
}
