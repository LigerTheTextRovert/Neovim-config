return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    -- local c = require("vscode.colors").get_colors()
    require("vscode").setup({
      transparent = false,
      disable_nvimtree_bg = true,
      group_overrides = {
        -- -- this supports the same val table as vim.api.nvim_set_hl
        -- -- use colors from this colorscheme by requiring vscode.colors!
        -- Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = false },
        -- -- CSS
        -- cssBraces = { fg = c.vscPink, bg = "NONE" },
        -- cssInclude = { fg = c.vscPink, bg = "NONE" },
        -- cssTagName = { fg = c.vscYellowOrange, bg = "NONE" },
        -- cssClassName = { fg = c.vscYellowOrange, bg = "NONE" },
        -- cssPseudoClass = { fg = c.vscYellowOrange, bg = "NONE" },
        -- cssPseudoClassId = { fg = c.vscYellowOrange, bg = "NONE" },
        -- cssPseudoClassLang = { fg = c.vscYellowOrange, bg = "NONE" },
        -- cssIdentifier = { fg = c.vscYellowOrange, bg = "NONE" },
        -- cssProp = { fg = c.vscLightBlue, bg = "NONE" },
        -- cssDefinition = { fg = c.vscLightBlue, bg = "NONE" },
        -- cssAttr = { fg = c.vscOrange, bg = "NONE" },
        -- cssAttrRegion = { fg = c.vscOrange, bg = "NONE" },
        -- cssColor = { fg = c.vscOrange, bg = "NONE" },
        -- cssFunction = { fg = c.vscOrange, bg = "NONE" },
        -- cssFunctionName = { fg = c.vscOrange, bg = "NONE" },
        -- cssVendor = { fg = c.vscOrange, bg = "NONE" },
        -- cssValueNumber = { fg = c.vscOrange, bg = "NONE" },
        -- cssValueLength = { fg = c.vscOrange, bg = "NONE" },
        -- cssUnitDecorators = { fg = c.vscOrange, bg = "NONE" },
        -- cssStyle = { fg = c.vscLightBlue, bg = "NONE" },
        -- cssImportant = { fg = c.vscBlue, bg = "NONE" },
      },
    })

    vim.cmd([[colorscheme vscode]])
  end,
}

-- return {
--   "craftzdog/solarized-osaka.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("solarized-osaka").setup({
--       transparent = true,
--     })
--     vim.cmd("colorscheme solarized-osaka")
--   end,
-- }

-- return {
--   "bluz71/vim-nightfly-colors",
--   name = "nightfly",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.nightflyTransparent = true
--     vim.cmd([[colorscheme nightfly]])
--   end,
-- }

-- return {
--   "webhooked/kanso.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     return {
--       "webhooked/kanso.nvim",
--       lazy = false,
--       priority = 1000,
--       -- Default options:
--       require("kanso").setup({
--         compile = false, -- enable compiling the colorscheme
--         undercurl = true, -- enable undercurls
--         commentStyle = { italic = true },
--         functionStyle = {},
--         keywordStyle = { italic = false },
--         statementStyle = {},
--         typeStyle = {},
--         transparent = false, -- do not set background color
--         dimInactive = false, -- dim inactive window `:h hl-NormalNC`
--         terminalColors = true, -- define vim.g.terminal_color_{0,17}
--         colors = {         -- add/modify theme and palette colors
--           palette = {},
--           theme = { zen = {}, pearl = {}, ink = {}, all = {} },
--         },
--         overrides = function(colors) -- add/modify highlights
--           return {}
--         end,
--         theme = "ink", -- Load "zen" theme
--         background = { -- map the value of 'background' option to a theme
--           dark = "ink", -- try "ink" !
--           light = "pearl",
--         },
--       }),
--
--       -- setup must be called before loading
--       vim.cmd("colorscheme kanso"),
--     }
--   end,
-- }

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     vim.cmd("colorscheme rose-pine-main")
--   end,
-- }

-- return {
--   "deparr/tairiki.nvim",
--   lazy = false,
--   priority = 1000, -- only necessary if you use tairiki as default theme
--   config = function()
--     require("tairiki").setup({
--       -- optional configuration here
--       style = "dark",            -- Default theme style. Choose between 'dark' (more styles on the way)
--       transparent = false,       -- Show/hide background
--       term_colors = true,        -- Change terminal color as per the selected theme style
--       ending_tildes = false,     -- Show the end-of-buffer tildes. By default they are hidden
--       cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
--       visual_bold = false,       -- bolden visual selections
--     })
--     require("tairiki").load()    -- only necessary to use as default theme, has same behavior as ':colorscheme tairiki'
--   end,
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
--   config = function()
--     vim.cmd([[colorscheme obscure]])
--   end,
-- }

-- return {
--   "rebelot/kanagawa.nvim",
--   priority = 1000,
--   config = function()
--     require("kanagawa").setup({
--       compile = false,
--       undercurl = true,
--       commentStyle = { bold = false },
--       functionStyle = { bold = false },
--       keywordStyle = { bold = false },
--       statementStyle = { bold = false },
--       typeStyle = { bold = false },
--       transparent = false,
--       dimInactive = false,
--       terminalColors = true,
--       colors = {
--         palette = {},
--         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--       },
--       theme = "dragon",
--       background = {
--         dark = "dragon",
--         light = "lotus",
--       },
--       overrides = function(colors)
--         return {
--           LineNr = { fg = colors.palette.sumiInk4, bg = "none" },
--           CursorLineNr = { fg = colors.palette.crystalBlue, bold = true },
--         }
--       end,
--     })
--
--     vim.cmd("colorscheme kanagawa")
--   end,
-- }
