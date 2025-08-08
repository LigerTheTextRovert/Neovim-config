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
        theme = "auto",
      },
    })
  end,
}
