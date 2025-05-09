return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*", -- Enable for all filetypes
				css = {
					rgb_fn = true, -- Enable parsing rgb(...) and rgba(...)
					hsl_fn = true, -- Enable parsing hsl(...) and hsla(...)
					names = true, -- Enable named colors like "red"
				},
				scss = {
					rgb_fn = true,
					hsl_fn = true,
					names = true,
				},
			}, {
				mode = "background", -- Or 'foreground' for better contrast
				css = true,
				css_fn = true, -- Enable function-style color specs
			})
		end,
	},
	{
		{
			"brenoprata10/nvim-highlight-colors",
			opts = {
				render = "background", -- or "foreground"
				enable_tailwind = true,
				enable_named_colors = true,
				enable_hex = true,
			},
			event = "VeryLazy",
		},
	},
}
