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
    git pull origin master
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

### Add git submodules

Add a submodule to budle directory

```console
git submodule add git://github.com/<plugin>.git .vim/bundle/<plugin>
```
