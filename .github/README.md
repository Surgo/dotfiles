# Lazy dotfiles 🐾

[![Lint](https://github.com/Surgo/dotfiles/actions/workflows/lint_commit.yml/badge.svg)](https://github.com/Surgo/dotfiles/actions/workflows/lint_commit.yml)

## Install

1. Install command-line tools for Xcode

    ```console
    xcode-select --install
    ```

1. Clone a repository

    ```console
    git init
    git remote add origin git@github.com:Surgo/dotfiles.git
    git pull origin main
    ```

1. Install submodules

    ```console
    git submodule update --init
    ```

1. Bootstrap

    ```console
    ./.bin/init.sh
    ```

## Usage

1. Update or regenerate dependencies

    ```console
    ~/.bin/update.sh
    ```

### Vim plugins

```console
$ tree ~/.vim/pack -d -L 2
"${HOME}"/.vim/pack
├── colors
│   └── start
├── plugins
│   └── start
└── syntax
    └── opt
```

### Zsh plugins

- [Oh My Zsh](https://ohmyz.sh/) based.

```console
$ tree ~/.config/zsh/custom -d -L 1
"${HOME}"/.config/zsh/custom
├── plugins
└── themes
```
