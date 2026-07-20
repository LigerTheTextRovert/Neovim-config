# Neovim Configuration

Personalized Neovim config using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [telescope/snacks.nvim picker](https://github.com/folke/snacks.nvim) | Fuzzy finder & file explorer |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File explorer (directory buffers) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting & trees |
| [vim-nightfly-colors](https://github.com/bluz71/vim-nightfly-colors) | Color scheme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git commands |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Commenting |
| [auto-session](https://github.com/rmagatti/auto-session) | Session management |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Tmux/split navigation |

## LSP Servers

`lua_ls`, `vtsls`, `pyright`, `gopls`, `tailwindcss`, `jsonls`, `emmet_ls`, `cssls`, `somesass_ls`, `clangd`, `rust_analyzer`, `eslint`

## Formatters

`prettier`, `stylua`, `black`, `isort`, `goimports`, `gofumpt`

## Keybindings

Leader key: `<Space>`

### Find & Search

| Keybind | Description |
|---------|-------------|
| `<leader>ff` | Find files |
| `<leader>fb` | Find buffers |
| `<leader>fc` | Find config file |
| `<leader>/` | Grep project |
| `<leader>sb` | Search buffer lines |
| `<leader>sB` | Grep open buffers |
| `<leader>sg` | Grep project |
| `<leader>sD` | Buffer diagnostics |

### Git

| Keybind | Description |
|---------|-------------|
| `<leader>gl` | Git log (current line) |
| `<leader>gs` | Git stash |
| `<leader>hp` | Toggle line blame / preview hunk |

### LSP

| Keybind | Description |
|---------|-------------|
| `gd` | Goto definition |
| `gD` | Goto declaration |
| `gr` | References |
| `gI` | Goto implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>tv` | Toggle diagnostic virtual text |

### Formatting

| Keybind | Description |
|---------|-------------|
| `<leader>mp` | Format file or range |

### Splits & Windows

| Keybind | Description |
|---------|-------------|
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<leader>se` | Equalize splits |
| `<leader>sx` | Close split |
| `<C-h>` | Move to left split |
| `<C-j>` | Move to lower split |
| `<C-k>` | Move to upper split |
| `<C-l>` | Move to right split |

### Navigation

| Keybind | Description |
|---------|-------------|
| `J` (visual) | Move selection down |
| `K` (visual) | Move selection up |
| `J` (normal) | Join lines (cursor stays) |
| `n` | Next search match (centered) |
| `N` | Previous search match (centered) |
| `<C-d>` | Half-page down (centered) |
| `<C-u>` | Half-page up (centered) |

### File Explorer

| Keybind | Description |
|---------|-------------|
| `-` | Open Oil (parent directory) |

### Session

| Keybind | Description |
|---------|-------------|
| `<leader>wr` | Restore session |
| `<leader>ws` | Save session |

### Run File

| Keybind | Description |
|---------|-------------|
| `<leader>0` | Run current file (js/ts/py/java/cpp/c) |

### Completion (Insert Mode)

| Keybind | Description |
|---------|-------------|
| `<C-j>` | Next item |
| `<C-k>` | Previous item |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<CR>` | Confirm selection |
| `<Tab>` | Jump forward in snippet |
| `<S-Tab>` | Jump backward in snippet |
| `<C-f>` | Scroll docs down |
| `<C-b>` | Scroll docs up |

### Oil Buffer Keymaps

| Keybind | Description |
|---------|-------------|
| `<CR>` | Open/select |
| `-` | Go to parent |
| `<C-s>` | Open in vertical split |
| `<C-h>` | Open in horizontal split |
| `<C-t>` | Open in tab |
| `<C-p>` | Preview |
| `<C-c>` | Close |
| `<C-l>` | Refresh |
| `gs` | Change sort |
| `gx` | Open externally |
| `g.` | Toggle hidden files |

## Installation

```sh
git clone https://github.com/LigerTheTextRovert/Neovim-config.git ~/.config/nvim
```

Open Neovim and let lazy.nvim install all plugins automatically.

## License

MIT
