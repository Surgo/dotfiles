# Lazy dotfiles
## Install

1. Install command line tools for Xcode

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

1. Update or regenerate

    ```console
    ./.bin/update.sh
    ```

## Vim plugins
### directory strucutre

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
