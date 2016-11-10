# Lazy dotfiles

## Install

1. Clone a repository
1. Install submodules

    ```console
    git submodule update --init
    ```

1. Create symbolic link to pathogen

    ```console
    ln -s ~/.vim/bundle/pathogen/autoload/pathogen.vim ~/.vim/autoload/
    ```

## Add git submodules

Add a submodule to budle directory

```console
git submodule add git://github.com/<plugin>.git .vim/bundle/<plugin>
```

## Update git submodules

Checkout and pull all submodules.::

```console
git submodule update --init
git submodule foreach 'git fetch; git reset --hard origin/master'
```

## Configure env

Add `/opt/homebrew/bin` to `/private/etc/paths` to install homebrew into `/opt/homebrew`
