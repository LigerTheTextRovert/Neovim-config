# Neovim Configuration

This repository contains a personalized Neovim configuration tailored for efficient and enjoyable coding experiences.

## Features

- **Language Support**: Enhanced syntax highlighting and indentation for various programming languages.
- **Keybindings**: Custom shortcuts to streamline navigation and editing.
- **Plugins**: A curated selection of plugins to boost productivity.
- **Theme**: Aesthetic color schemes for a pleasant visual experience.

## Supported Languages

The configuration includes support for multiple programming languages, ensuring proper syntax highlighting and indentation.

## Keybindings

Custom keybindings have been set up to enhance the editing workflow.

- ### Telescope keybindings

| Keybind      | Description                     |
| ------------ | ------------------------------- |
| `<leader>ff` | Fuzzy find files in cwd         |
| `<leader>fr` | Fuzzy find recent files         |
| `<leader>fs` | Find string in cwd              |
| `<leader>fc` | Find string under cursor in cwd |
| `<leader>fb` | Find buffers                    |

- ### Keymaps for spliting windows

| Keybind      | Description               |
| ------------ | ------------------------- |
| `<leader>sv` | Split window vertically   |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Make splits equal size    |
| `<leader>sx` | Close current split       |

- ### Keymaps for easy navigation though file

| Keybind          | Description                                             |
| ---------------- | ------------------------------------------------------- |
| `J` (visual)     | Move selected lines down while maintaining indentation. |
| `K` (visual)     | Move selected lines up while maintaining indentation.   |
| `J` (normal)     | Join lines without moving the cursor position.          |
| `n` (normal)     | Jump to next search match and center the cursor.        |
| `N` (normal)     | Jump to previous search match and center the cursor.    |
| `<C-d>` (normal) | Scroll half-page down and center the cursor.            |
| `<C-u>` (normal) | Scroll half-page up and center the cursor.              |

- ### file-tree keymaps

| Keybind      | Description                          |
| ------------ | ------------------------------------ |
| `n` (normal) | Opens up the oil-nvim                |
| `<leader>ee` | Toggle file explorer                 |
| `<leader>ef` | Toggle file explorer on current file |
| `<leader>ec` | Collapse file explorer               |
| `<leader>er` | Refresh file explorer                |

## Plugins

A variety of plugins are integrated to extend Neovim's functionality.

## Theme

The configuration applies an aesthetic color scheme for a pleasant coding environment.

## Installation

To set up this Neovim configuration:

1. **Clone the Repository**:

   ```sh
   git clone https://github.com/LigerTheTextRovert/Neovim-config.git ~/.config/nvim
   ```

2. **Install Dependencies**:

   Ensure that all necessary dependencies, such as Neovim and any required plugins, are installed.

3. **Launch Neovim**:

   Open Neovim to allow the plugins to install and the configuration to load.

## Usage

Once installed, launch Neovim to experience the customized setup. Explore the keybindings and features to familiarize yourself with the environment.

## Contributing

Contributions are welcome! If you have suggestions or improvements, feel free to fork the repository and submit a pull request.

## License

This project is licensed under the MIT License.

---

For more details and the latest updates, visit the [GitHub repository](https://github.com/LigerTheTextRovert/Neovim-config).
