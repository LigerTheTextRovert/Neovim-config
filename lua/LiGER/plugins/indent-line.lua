return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = { char = "▏" }, -- or "▏", "¦", "┆", "┊"
		-- indent = { tab_char = ">" },

		scope = {
			enabled = false,
			show_start = false,
			show_end = false,
		},
		exclude = {
			filetypes = {
				"help",
				"terminal",
				"lazy",
				"NvimTree",
				"TelescopePrompt",
				"dashboard",
				"lspinfo",
				"packer",
			},
			buftypes = {
				"terminal",
				"nofile",
			},
		},
	},
}
