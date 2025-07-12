require("LiGER.core")
require("LiGER.lazy")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.js",
  callback = function()
    vim.bo.filetype = "javascriptreact"
  end,
})
