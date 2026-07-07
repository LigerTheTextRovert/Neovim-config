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
							modified = " ●",
							readonly = " [RO]",
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
	end,
}
-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		require("lualine").setup({
-- 			options = {
-- 				icons_enabled = true,
-- 				theme = "auto",
-- 				-- component_separators = { left = "", right = "" },
-- 				-- section_separators = { left = "", right = "" },
-- 				component_separators = {},
-- 				section_separators = {},
-- 				disabled_filetypes = {
-- 					statusline = {},
-- 					winbar = {},
-- 				},
-- 				ignore_focus = {},
-- 				always_divide_middle = false,
-- 				always_show_tabline = true,
-- 				globalstatus = false,
-- 				refresh = {
-- 					statusline = 1000,
-- 					tabline = 1000,
-- 					winbar = 1000,
-- 					refresh_time = 16, -- ~60fps
-- 					events = {
-- 						"WinEnter",
-- 						"BufEnter",
-- 						"BufWritePost",
-- 						"SessionLoadPost",
-- 						"FileChangedShellPost",
-- 						"VimResized",
-- 						"Filetype",
-- 						"CursorMoved",
-- 						"CursorMovedI",
-- 						"ModeChanged",
-- 					},
-- 				},
-- 			},
-- 			sections = {
-- 				lualine_a = {
-- 					{
-- 						"mode",
-- 						fmt = function(str)
-- 							local map = {
-- 								["NORMAL"] = "N",
-- 								["INSERT"] = "I",
-- 								["VISUAL"] = "V",
-- 								["V-LINE"] = "VL",
-- 								["V-BLOCK"] = "VB",
-- 								["SELECT"] = "S",
-- 								["COMMAND"] = "C",
-- 								["REPLACE"] = "R",
-- 								["TERMINAL"] = "T",
-- 							}
-- 							return map[str] or str:sub(1, 1)
-- 						end,
-- 					},
-- 				},
-- 				lualine_b = {
-- 					"branch",
-- 					{
-- 						"diagnostics",
-- 						sources = { "nvim_diagnostic" },
-- 						sections = { "error", "warn" },
-- 						symbols = { error = "E: ", warn = "W: " },
-- 						colored = true,
-- 						update_in_insert = true,
-- 						always_visible = true,
-- 					},
-- 				},
-- 				lualine_c = {
-- 					{
-- 						"filename", -- component name
-- 						path = 1, -- show relative path
-- 						symbols = { -- add dot for unsaved changes
-- 							modified = " ●",
-- 							readonly = " ",
-- 							unnamed = "[No Name]",
-- 							newfile = "[New]",
-- 						},
-- 					},
-- 				},
-- 				lualine_x = { "lsp_status" },
-- 				lualine_y = {},
-- 				lualine_z = {},
-- 			},
-- 			inactive_sections = {
-- 				lualine_a = {},
-- 				lualine_b = {},
-- 				lualine_c = { "filename" },
-- 				lualine_x = { "location" },
-- 				lualine_y = {},
-- 				lualine_z = {},
-- 			},
-- 			tabline = {},
-- 			winbar = {},
-- 			inactive_winbar = {},
-- 			extensions = {},
-- 		})
-- 	end,
-- }
