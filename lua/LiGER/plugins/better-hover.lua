return {
	"Sebastian-Nielsen/better-type-hover",
	event = "BufEnter", -- Loads when entering any buffer
	config = function()
		require("better-type-hover").setup({
			-- The primary key to hit to open the main window
			openTypeDocKeymap = "<K>",
			-- Whether to fallback to the old `vim.lsp.buf.hover()` when triggered on anything but an interface or type.
			-- Strongly adviced to keep this on true as it's not stable otherwise.
			fallback_to_old_on_anything_but_interface_and_type = true,
			-- If the declaration in the window is longer than 20 lines remove all lines after the 20th line.
			fold_lines_after_line = 20,
			-- These letters/digits are used in order
			keys_that_open_nested_types = { "a", "s", "b", "i", "e", "u", "r", "x" },
			-- This is to avoid a type hint (i.e. a letter) showing up in the main window
			types_to_not_expand = { "string", "number", "boolean", "Date" },
		})

		-- After calling the setup you can overwrite any of the colors with:
		vim.cmd("highlight key_hint_color guifg=#FFFFFF guibg=NONE") -- white
		vim.cmd("highlight selected_key_hint_color guifg=#BC0000 guibg=NONE") -- red
	end,
}
