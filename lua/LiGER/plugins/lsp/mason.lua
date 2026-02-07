-- ~/nvim/lua/slydragonn/plugins/mason.lua

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "cssls",
        "gopls",
        "eslint",
        "somesass_ls",
        "html",
        "emmet_ls",
        "clangd",
        "jsonls",
        "vtsls",
        "pyright",
        "tailwindcss",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua", -- lua formatter
        "eslint_d",
      },
    })
  end,
}
