return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      playground = { enable = true },
      highlight = {
        enable = true,
      },
      -- ...
      inject = {
        -- Highlight JSDoc comments
        jsdoc = {
          enable = true,
          query = [[
        (jsdoc_comment) @jsdoc
      ]],
        },
      },
      -- enable indentation
      indent = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "jsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "go",
        "vim",
        "dockerfile",
        "gitignore",
        "scss",
        "query",
        "vimdoc",
        "python",
        "c",
      },
      -- incremental_selection = {
      --     enable = true,
      --     keymaps = {
      --         init_selection = "<C-space>",
      --         node_incremental = "<C-space>",
      --         scope_incremental = false,
      --         node_decremental = "<bs>",
      --     },
      -- },
    })
  end,
}
