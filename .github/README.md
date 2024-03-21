# Lazy dotfiles 🐾

[![Lint](https://github.com/Surgo/dotfiles/actions/workflows/lint_commit.yml/badge.svg)](https://github.com/Surgo/dotfiles/actions/workflows/lint_commit.yml)

## The tools I use

- [iTerm2](https://iterm2.com/) terminal emulator
- [tmux](https://tmux.github.io/) terminal multiplexer
  - Awesome [plugins](https://github.com/Surgo/dotfiles/tree/main/.config/tmux/plugins)
- [Zsh](https://www.zsh.org/) shell
  - [Oh My Zsh](https://ohmyz.sh/) framework
  - [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
  - Awesome [plugins](https://github.com/Surgo/dotfiles/tree/main/.config/zsh/custom/plugins)
- [Vim](https://www.vim.org/) the editor
  - Awesome [plugins](https://github.com/Surgo/dotfiles/tree/main/.vim/pack/plugins/start),
    [syntax](https://github.com/Surgo/dotfiles/tree/main/.vim/pack/syntax/opt),
    and [colors](https://github.com/Surgo/dotfiles/tree/main/.vim/pack/colors/start)
- [NeoVim](https://neovim.io/)
  - Awesome [plugins](https://github.com/Surgo/dotfiles/tree/main/.config/nvim/pack/plugins/start/), and [colorscheme](https://github.com/Surgo/dotfiles/tree/main/.config/nvim/pack/colorscheme/start/)
- [Catppuccin](https://catppuccin.com/) theme for each tools
- And many more [Command-line tools](https://github.com/Surgo/dotfiles/blob/main/.Brewfile)

## Install

1. Install command-line tools for Xcode

  ```sh
  xcode-select --install
  ```

1. Clone a repository

  ```sh
  git init
  git remote add origin git@github.com:Surgo/dotfiles.git
  git pull origin main
  ```

1. Install submodules

  ```sh
  git submodule update --init
  ```

1. Bootstrap

  ```sh
  ./.bin/init.sh
  ```

## Usage

1. Update or regenerate dependencies

  ```sh
  ~/.bin/update.sh
  ```
