return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = {
					normal = {
						a = { bg = "none", fg = "none" },
						b = { bg = "none", fg = "none" },
						c = { bg = "none", fg = "none" },
					},
					inactive = {
						a = { bg = "none", fg = "none" },
						b = { bg = "none", fg = "none" },
						c = { bg = "none", fg = "none" },
					},
				},
				component_separators = {},
				section_separators = {},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							-- return str:sub(1, 1):upper() .. str:sub(2):lower()
							return "--" .. str:upper() .. "--"
						end,
					},
				},
				lualine_b = {
					{
						"branch",
						fmt = function(str)
							return str ~= "" and "git::" .. str or ""
						end,
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "hint" },
						symbols = { error = "E:", warn = "W:", hint = "H:" },
						colored = true,
						update_in_insert = true,
						always_visible = true,
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = "[+]",
							readonly = "[RO]",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})

		-- vim.api.nvim_set_hl(0, "StatusLine", {
		-- 	bg = "#007ACC",
		-- 	fg = "#FFFFFF",
		-- })
		--
		-- vim.api.nvim_set_hl(0, "StatusLineNC", {
		-- 	bg = "#007ACC",
		-- 	fg = "#FFFFFF",
		-- })
	end,
}
