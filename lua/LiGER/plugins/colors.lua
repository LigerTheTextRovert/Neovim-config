return {
	"Mofiqul/vscode.nvim",
	priority = 1000,
	config = function()
		local c = require("vscode.colors").get_colors()
		require("vscode").setup({
			transparent = true,
			disable_nvimtree_bg = false,

			group_overrides = {
				-- this supports the same val table as vim.api.nvim_set_hl
				-- use colors from this colorscheme by requiring vscode.colors!
				Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
				-- CSS
				cssBraces = { fg = c.vscPink, bg = "NONE" },
				cssInclude = { fg = c.vscPink, bg = "NONE" },
				cssTagName = { fg = c.vscYellowOrange, bg = "NONE" },
				cssClassName = { fg = c.vscYellowOrange, bg = "NONE" },
				cssPseudoClass = { fg = c.vscYellowOrange, bg = "NONE" },
				cssPseudoClassId = { fg = c.vscYellowOrange, bg = "NONE" },
				cssPseudoClassLang = { fg = c.vscYellowOrange, bg = "NONE" },
				cssIdentifier = { fg = c.vscYellowOrange, bg = "NONE" },
				cssProp = { fg = c.vscLightBlue, bg = "NONE" },
				cssDefinition = { fg = c.vscLightBlue, bg = "NONE" },
				cssAttr = { fg = c.vscOrange, bg = "NONE" },
				cssAttrRegion = { fg = c.vscOrange, bg = "NONE" },
				cssColor = { fg = c.vscOrange, bg = "NONE" },
				cssFunction = { fg = c.vscOrange, bg = "NONE" },
				cssFunctionName = { fg = c.vscOrange, bg = "NONE" },
				cssVendor = { fg = c.vscOrange, bg = "NONE" },
				cssValueNumber = { fg = c.vscOrange, bg = "NONE" },
				cssValueLength = { fg = c.vscOrange, bg = "NONE" },
				cssUnitDecorators = { fg = c.vscOrange, bg = "NONE" },
				cssStyle = { fg = c.vscLightBlue, bg = "NONE" },
				cssImportant = { fg = c.vscBlue, bg = "NONE" },
			},
		})

		vim.cmd([[colorscheme vscode]])
	end,
}

-- return {
-- 	"webhooked/kanso.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		return {
-- 			"webhooked/kanso.nvim",
-- 			lazy = false,
-- 			priority = 1000,
-- 			-- Default options:
-- 			require("kanso").setup({
-- 				compile = false, -- enable compiling the colorscheme
-- 				undercurl = true, -- enable undercurls
-- 				commentStyle = { italic = true },
-- 				functionStyle = {},
-- 				keywordStyle = { italic = false },
-- 				statementStyle = {},
-- 				typeStyle = {},
-- 				transparent = false, -- do not set background color
-- 				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
-- 				terminalColors = true, -- define vim.g.terminal_color_{0,17}
-- 				colors = { -- add/modify theme and palette colors
-- 					palette = {},
-- 					theme = { zen = {}, pearl = {}, ink = {}, all = {} },
-- 				},
-- 				overrides = function(colors) -- add/modify highlights
-- 					return {}
-- 				end,
-- 				theme = "ink", -- Load "zen" theme
-- 				background = { -- map the value of 'background' option to a theme
-- 					dark = "ink", -- try "ink" !
-- 					light = "pearl",
-- 				},
-- 			}),
--
-- 			-- setup must be called before loading
-- 			vim.cmd("colorscheme kanso"),
-- 		}
-- 	end,
-- }

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "auto", -- auto, main, moon, or dawn
-- 			dark_variant = "main", -- main, moon, or dawn
-- 			dim_inactive_windows = false,
-- 			extend_background_behind_borders = true,
--
-- 			enable = {
-- 				terminal = true,
-- 				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
-- 				migrations = true, -- Handle deprecated options automatically
-- 			},
--
-- 			styles = {
-- 				bold = false,
-- 				italic = false,
-- 				transparency = true,
-- 			},
--
-- 			groups = {
-- 				border = "muted",
-- 				link = "iris",
-- 				panel = "surface",
--
-- 				error = "love",
-- 				hint = "iris",
-- 				info = "foam",
-- 				note = "pine",
-- 				todo = "rose",
-- 				warn = "gold",
--
-- 				git_add = "foam",
-- 				git_change = "rose",
-- 				git_delete = "love",
-- 				git_dirty = "rose",
-- 				git_ignore = "muted",
-- 				git_merge = "iris",
-- 				git_rename = "pine",
-- 				git_stage = "iris",
-- 				git_text = "rose",
-- 				git_untracked = "subtle",
--
-- 				h1 = "iris",
-- 				h2 = "foam",
-- 				h3 = "rose",
-- 				h4 = "gold",
-- 				h5 = "pine",
-- 				h6 = "foam",
-- 			},
--
-- 			palette = {
-- 				main = {},
-- 			},
-- 		})
--
-- 		vim.api.nvim_set_hl(0, "FunctionParameter", { fg = "#c9cbff" }) -- Replace with your desired color
--
-- 		vim.api.nvim_create_autocmd("Syntax", {
-- 			pattern = "@function",
-- 			callback = function()
-- 				vim.api.nvim_set_hl(0, "FunctionParameter", { link = "Function" })
-- 			end,
-- 		})
--
-- 		vim.cmd("colorscheme rose-pine-main")
-- 	end,
-- }

-- return {
-- 	"deparr/tairiki.nvim",
-- 	lazy = false,
-- 	priority = 1000, -- only necessary if you use tairiki as default theme
-- 	config = function()
-- 		require("tairiki").setup({
-- 			-- optional configuration here
-- 			style = "dark", -- Default theme style. Choose between 'dark' (more styles on the way)
-- 			transparent = false, -- Show/hide background
-- 			term_colors = true, -- Change terminal color as per the selected theme style
-- 			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
-- 			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
-- 			visual_bold = false, -- bolden visual selections
-- 		})
-- 		require("tairiki").load() -- only necessary to use as default theme, has same behavior as ':colorscheme tairiki'
-- 	end,
-- }

-- return {
--   "killitar/obscure.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     transparent = true,
--     -- terminal_colors = true,
--     -- dim_inactive = true,
--     -- styles = {
--     --   keywords = { italic = true },
--     --   identifiers = {},
--     --   functions = {},
--     --   variables = {},
--     --   booleans = {},
--     --   comments = { italic = true },
--     -- },
--     --
--     -- --- You can override specific highlights to use other groups or a hex color
--     -- --- function will be called with a Highlights and ColorScheme table
--     --
--     -- -- on_highlights = function(highlights, colors) end,
--     --
--     -- plugins = {
--     --   -- enable all plugins when not using lazy.nvim
--     --   -- set to false to manually enable/disable plugins
--     --   all = package.loaded.lazy == nil,
--     --   -- uses your plugin manager to automatically enable needed plugins
--     --   -- currently only lazy.nvim is supported
--     --   auto = true,
--     --   -- add any plugins here that you want to enable
--     --   -- for all possible plugins, see:
--     --   --   * https://github.com/killitar/obscure.nvim/tree/main/lua/obscure/groups
--     --   -- flash = true,
--     -- },
--   },
--   config = function ()
--     vim.cmd[[colorscheme obscure]]
--   end
-- }

-- return {
-- 	"craftzdog/solarized-osaka.nvim",
-- 	lazy = false,
-- 	priority = 1001,
-- 	config = function()
-- 		require("solarized-osaka").setup({
-- 			-- your configuration comes here
-- 			-- or leave it empty to use the default settings
-- 			transparent = false, -- Enable this to disable setting the background color
-- 			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
-- 			styles = {
-- 				-- Style to be applied to different syntax groups
-- 				-- Value is any valid attr-list value for `:help nvim_set_hl`
-- 				comments = {},
-- 				keywords = {},
-- 				functions = {},
-- 				variables = {},
-- 				-- Background styles. Can be "dark", "transparent" or "normal"
-- 				sidebars = "transparent", -- style for sidebars, see below
-- 				floats = "transparent", -- style for floating windows
-- 			},
-- 			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
-- 			day_brightness = 1.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
-- 			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
-- 			dim_inactive = false, -- dims inactive windows
-- 			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--
-- 			--- You can override specific color groups to use other groups or a hex color
-- 			--- function will be called with a ColorScheme table
-- 			---@param colors ColorScheme
-- 			on_colors = function(colors) end,
--
-- 			--- You can override specific highlights to use other groups or a hex color
-- 			--- function will be called with a Highlights and ColorScheme table
-- 			---@param highlights Highlights
-- 			---@param colors ColorScheme
-- 			on_highlights = function(highlights, colors) end,
-- 		})
-- 		vim.cmd([[colorscheme solarized-osaka]])
-- 	end,
-- }

-- return {
--   "xiantang/darcula-dark.nvim",
--   config = function ()
--     vim.cmd.colorscheme("darcula-dark")
--   end
-- }

-- return {
--     "rebelot/kanagawa.nvim",
--     priority = 1000,
--     config = function()
--         -- Default options:
--         require('kanagawa').setup({
--             compile = false,             -- enable compiling the colorscheme
--             undercurl = true,            -- enable undercurls
--             commentStyle = {},
--             functionStyle = {},
--             keywordStyle = {},
--             statementStyle = {},
--             typeStyle = {},
--             transparent = false,         -- do not set background color
--             dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
--             terminalColors = true,       -- define vim.g.terminal_color_{0,17}
--             colors = {                   -- add/modify theme and palette colors
--                 palette = {},
--                 theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--             },
--             theme = "dragon",              -- Load "wave" theme when 'background' option is not set
--             background = {               -- map the value of 'background' option to a theme
--                 dark = "dragon",           -- try "dragon" !
--                 light = "lotus"
--             },
--         })
--
--         vim.cmd("colorscheme kanagawa")
--     end,
-- }
