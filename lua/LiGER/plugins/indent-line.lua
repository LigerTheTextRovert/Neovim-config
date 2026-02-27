return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = { char = "▏" }, -- or "▏", "¦", "┆", "┊"
		scope = {
			enabled = true,
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
