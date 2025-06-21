# 🐾 Lazy dotfiles 🛰️

[![Lint](https://github.com/Surgo/dotfiles/actions/workflows/lint_commit.yml/badge.svg)](https://github.com/Surgo/dotfiles/actions/workflows/lint_commit.yml)

<!-- https://badges.pages.dev/ -->

![bat](https://img.shields.io/badge/bat-31369E?logo=bat&logoColor=fff&style=flat)
![Debian](https://img.shields.io/badge/Debian-A81D33?logo=debian&logoColor=fff&style=flat)
![Git](https://img.shields.io/badge/Git-F05032?logo=git&logoColor=fff&style=flat)
![Homebrew](https://img.shields.io/badge/Homebrew-FBB040?logo=homebrew&logoColor=fff&style=flat)
![iTerm2](https://img.shields.io/badge/iTerm2-000?logo=iterm2&logoColor=fff&style=flat)
![macOS](https://img.shields.io/badge/macOS-000?logo=macos&logoColor=fff&style=flat)
![Neovim](https://img.shields.io/badge/Neovim-57A143?logo=neovim&logoColor=fff&style=flat)
![tmux](https://img.shields.io/badge/tmux-1BB91F?logo=tmux&logoColor=fff&style=flat)
![Vim](https://img.shields.io/badge/Vim-019733?logo=vim&logoColor=fff&style=flat)
![Zsh](https://img.shields.io/badge/Zsh-F15A24?logo=zsh&logoColor=fff&style=flat)

## Install

### MacOS

```sh
# Install Xcode command line tools
xcode-select --install

# Clone the repository
cd "${HOME}"
git init --initial-branch=main
git remote add origin git@github.com:Surgo/dotfiles.git
git pull origin main
git submodule update --init --recursive

# Run the bootstrap script
~/.bin/init.sh
```

## Usage

```sh
# Update or re-generate dependencies
~/.bin/update.sh
```

### Configure

- Environment variables: `~/.config/sh/local.template`
- LSP: `~/.config/nvim/*.template`
