return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
    "b0o/schemastore.nvim", -- for jsonls
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local keymap = vim.keymap

    -- diagnostic signs (icons in gutter)
    local signs = {
      Error = " ",
      Warn = " ",
      Hint = "󰌵",
      Info = " ",
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- diagnostics config
    local diagnostic_virtual_text = true
    vim.diagnostic.config({
      virtual_text = {
        source = true,
        spacing = 2,
        prefix = "●",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    keymap.set("n", "<leader>tv", function()
      diagnostic_virtual_text = not diagnostic_virtual_text
      vim.diagnostic.config({ virtual_text = diagnostic_virtual_text })
      print("Virtual Text: " .. (diagnostic_virtual_text and "ON" or "OFF"))
    end, { desc = "Toggle virtual text" })

    -- formatting on save
    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
    end

    -- keymaps on LspAttach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    mason_lspconfig.setup_handlers({
      function(server_name) -- default handler
        vim.lsp.config(server_name, {
          on_attach = on_attach,
          capabilities = capabilities,
        })
        vim.lsp.enable(server_name)
      end,

      -- Lua
      ["lua_ls"] = function()
        require("neodev").setup()
        vim.lsp.config("lua_ls", {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        })
        vim.lsp.enable("lua_ls")
      end,

      -- TypeScript / JavaScript
      ["vtsls"] = function()
        vim.lsp.config("vtsls", {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "relative",
                includeCompletionsForModuleExports = true,
              },
              suggest = { completeFunctionCalls = true },
            },
          },
        })
        vim.lsp.enable("vtsls")
      end,

      -- CSS (includes SCSS & Less)
      ["cssls"] = function()
        vim.lsp.config("cssls", {
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { "css", "scss", "less" },
        })
        vim.lsp.enable("cssls")
      end,

      -- SCSS linter / formatter (optional, install `stylelint-lsp`)
      ["stylelint_lsp"] = function()
        vim.lsp.config("stylelint_lsp", {
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { "css", "scss", "less" },
        })
        vim.lsp.enable("stylelint_lsp")
      end,

      -- TailwindCSS
      ["tailwindcss"] = function()
        local util = require("lspconfig.util")
        vim.lsp.config("tailwindcss", {
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
            "vue",
            "php",
            "eelixir",
            "eruby",
          },
          init_options = {
            userLanguages = {
              eelixir = "html",
              eruby = "html",
              php = "html",
            },
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { "tw`([^`]*)`",   "1" },
                  { 'tw="([^"]*)"',  "1" },
                  { "tw%(([^)]*)%)", "1" },
                },
              },
            },
          },
          root_dir = util.root_pattern(
            "tailwind.config.js",
            "tailwind.config.cjs",
            "tailwind.config.ts",
            "postcss.config.js",
            "package.json",
            ".git"
          ),
        })
        vim.lsp.enable("tailwindcss")
      end,

      -- JSON
      ["jsonls"] = function()
        vim.lsp.config("jsonls", {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        })
        vim.lsp.enable("jsonls")
      end,
      ["pyright"] = function()
        vim.lsp.config("pyright", {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            python = {
              pythonPath = vim.fn.getcwd() .. "/venv/bin/python",
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        })
        vim.lsp.enable("pyright")
      end,
      ["gopls"] = function()
        require("lspconfig").gopls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = { "gopls", "serve" },
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              gofumpt = true,
              codelenses = {
                generate = true,
                gc_details = true,
                test = true,
                tidy = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              semanticTokens = true,
            },
          },
        })
      end,
    })
  end,
}
