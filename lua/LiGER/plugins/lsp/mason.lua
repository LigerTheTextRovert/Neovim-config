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
                "lua_ls",
                "cssls",
                "gopls",
                "eslint",
                "somesass_ls",
                "emmet_ls",
                "clangd",
                "jsonls",
                "vtsls",
                "pyright",
                "tailwindcss",
                "rust_analyzer",
            },
            automatic_enable = false,
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "eslint_d",
                "black",
                "isort",
                "goimports",
                "gofumpt",
            },
        })
    end,
}
