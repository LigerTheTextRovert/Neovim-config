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

-- return {
-- 	"bluz71/vim-nightfly-colors",
-- 	name = "nightfly",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.o.termguicolors = true
-- 		vim.g.nightflyTransparent = true
-- 		vim.cmd([[colorscheme nightfly]])
-- 		vim.cmd([[highlight WinSeparator guibg=none guifg=#3e4451]])
-- 	end,
-- }

return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("kanagawa").setup({
			compile = false,
			undercurl = true,
			commentStyle = {},
			functionStyle = {},
			keywordStyle = {},
			statementStyle = {},
			typeStyle = {},
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			colors = {
				palette = {},
				theme = {
					wave = {},
					lotus = {},
					dragon = {},
					all = {},
				},
			},
			overrides = function(colors)
				return {
					SignColumn = { bg = "NONE" },
					LineNr = { bg = "NONE" },
					-- Git signs
					GitSignsAdd = { fg = "#76946A", bg = "NONE" }, -- green
					GitSignsChange = { fg = "#DCA561", bg = "NONE" }, -- yellow/orange
					GitSignsDelete = { fg = "#C34043", bg = "NONE" }, -- red
					-- Optional
					GitSignsChangedelete = { fg = "#DCA561", bg = "NONE" },
					GitSignsTopdelete = { fg = "#C34043", bg = "NONE" },
					GitSignsUntracked = { fg = "#76946A", bg = "NONE" },
				}
			end,
			theme = "wave",
			background = {
				dark = "wave",
				light = "lotus",
			},
		})
		vim.cmd("colorscheme kanagawa")
		vim.cmd([[highlight WinSeparator guibg=#313640 guifg=#3e4451]])
	end,
}

-- return {
-- 	"nickkadutskyi/jb.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		-- require("jb").setup({transparent = true})
-- 		vim.cmd("colorscheme jb")
-- 	end,
-- }

-- return {
-- 	"craftzdog/solarized-osaka.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("solarized-osaka").setup({
-- 			style = "", -- The default dark style. Set to `vivid` for a higher-contrast variant that stays readable in bright environments
-- 			transparent = true, -- Enable this to disable setting the background color
-- 			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
-- 			styles = {
-- 				-- Style to be applied to different syntax groups
-- 				-- Value is any valid attr-list value for `:help nvim_set_hl`
-- 				comments = { italic = false },
-- 				keywords = { italic = false },
-- 				functions = {},
-- 				variables = {},
-- 				-- Background styles. Can be "dark", "transparent" or "normal"
-- 				sidebars = "dark", -- style for sidebars, see below
-- 				floats = "dark", -- style for floating windows
-- 			},
-- 			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
-- 			vivid_brightness = 0.3, -- Adjusts how far the **Vivid** style brightens text colors. Number between 0 and 1, from the default palette to white
-- 			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
-- 			dim_inactive = false, -- dims inactive windows
-- 			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
-- 		})
-- 		vim.cmd([[colorscheme solarized-osaka]])
-- 	end,
-- }
