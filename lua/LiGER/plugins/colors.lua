-- return {
--   "Mofiqul/vscode.nvim",
--   priority = 1000,
--   config = function()
--     -- local c = require("vscode.colors").get_colors()
--     require("vscode").setup({
--       transparent = true,
--       disable_nvimtree_bg = true,
--     })
--     vim.opt.fillchars = {
--       horiz = "━", -- horizontal split line
--       horizup = "┻", -- ┻ at the top intersection
--       horizdown = "┳", -- ┳ at the bottom intersection
--       vert = "┃", -- vertical split line
--       vertleft = "┫", -- ┫ when a vertical split meets left side
--       vertright = "┣", -- ┣ when a vertical split meets right side
--       verthoriz = "╋", -- ╋ when vertical & horizontal splits intersect
--     }
--
--     vim.cmd([[colorscheme vscode]])
--   end,
-- }

return {
  "bluz71/vim-nightfly-colors",
  name = "nightfly",
  lazy = false,
  priority = 1000,
  config = function()
    -- Lua initialization file
    vim.opt.fillchars = {
      horiz = "━",
      horizup = "┻",
      horizdown = "┳",
      vert = "┃",
      vertleft = "┫",
      vertright = "┣",
      verthoriz = "╋",
    }
    require("nightfly").custom_colors({
      bg = "#161616",
    })
    vim.cmd([[colorscheme nightfly]])
  end,
}
