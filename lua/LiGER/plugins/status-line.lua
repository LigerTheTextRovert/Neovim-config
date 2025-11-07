-- return {
--   -- Calls `require('slimline').setup({})`
--   "sschleemilch/slimline.nvim",
--   opts = {
--     spaces = {
--       components = "",
--       left = "",
--       right = "",
--     },
--     sep = {
--       hide = {
--         first = true,
--         last = true,
--       },
--       -- left = "",
--       -- right = "",
--       left = " ",
--       right = " ",
--     },
--   },
-- }

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "$vim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "modus-vivendi",
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        component_separators = {},
        section_separators = {},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 16, -- ~60fps
          events = {
            "WinEnter",
            "BufEnter",
            "BufWritePost",
            "SessionLoadPost",
            "FileChangedShellPost",
            "VimResized",
            "Filetype",
            "CursorMoved",
            "CursorMovedI",
            "ModeChanged",
          },
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              local map = {
                ["NORMAL"] = "N",
                ["INSERT"] = "I",
                ["VISUAL"] = "V",
                ["V-LINE"] = "VL",
                ["V-BLOCK"] = "VB",
                ["SELECT"] = "S",
                ["COMMAND"] = "C",
                ["REPLACE"] = "R",
                ["TERMINAL"] = "T",
              }
              return map[str] or str:sub(1, 1)
            end,
          },
        },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename", -- component name
            path = 1, -- show relative path
            symbols = { -- add dot for unsaved changes
              modified = " ●",
              readonly = " ",
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
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
