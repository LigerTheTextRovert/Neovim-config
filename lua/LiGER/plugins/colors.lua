return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    -- local c = require("vscode.colors").get_colors()
    require("vscode").setup({
      transparent = true,
      disable_nvimtree_bg = true,
    })
    vim.cmd([[colorscheme vscode]])
  end,
}

-- return {
--   "dapovich/anysphere.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("anysphere")
--   end,
-- }

-- return {
--   "bluz71/vim-nightfly-colors",
--   name = "nightfly",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.o.termguicolors = true
--     vim.g.nightflyTransparent = true -- this enables transparent background
--     vim.cmd([[colorscheme nightfly]])
--   end,
-- }
