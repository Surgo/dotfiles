# Lazy dotfiles 🐾

[![Lint](https://github.com/Surgo/dotfiles/actions/workflows/lint_commit.yml/badge.svg)](https://github.com/Surgo/dotfiles/actions/workflows/lint_commit.yml)

## The tools I use

- [iTerm2](https://iterm2.com/)
- [tmux](https://tmux.github.io/): [plugins](https://github.com/Surgo/dotfiles/tree/main/.config/tmux/plugins)
- [Zsh](https://www.zsh.org/): [plugins](https://github.com/Surgo/dotfiles/tree/main/.config/zsh/custom/plugins)
  - [Oh My Zsh](https://ohmyz.sh/)
  - [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Vim](https://www.vim.org/):
  [plugins](https://github.com/Surgo/dotfiles/tree/main/.config/vim/pack/plugins/start),
  [syntax](https://github.com/Surgo/dotfiles/tree/main/.config/vim/pack/syntax/opt),
  [colors](https://github.com/Surgo/dotfiles/tree/main/.config/vim/pack/colors/start)
- [NeoVim](https://neovim.io/):
  [plugins](https://github.com/Surgo/dotfiles/tree/main/.config/nvim/pack/plugins/start/),
  [colorscheme](https://github.com/Surgo/dotfiles/tree/main/.config/nvim/pack/colorscheme/start/)
- [Catppuccin](https://catppuccin.com/) theme for each tools
- And many [more](https://github.com/Surgo/dotfiles/blob/main/.Brewfile)

## Install

1. Install command-line tools for Xcode

   ```sh
   xcode-select --install
   ```

2. Clone a repository

   ```sh
   git init
   git remote add origin git@github.com:Surgo/dotfiles.git
   git pull origin main
   git submodule update --init
   ```

3. Bootstrap

   ```sh
   ./.bin/init.sh
   ```

## Usage

### Configure

- Environment variables: `~/.config/sh/local.template`
- LSP: `~/.config/lsp/*.template`

### Update or re-generate dependencies

```sh
~/.bin/update.sh
```
