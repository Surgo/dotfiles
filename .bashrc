# Fist of all
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Add my scripts
PATH=~/bin:$PATH

export HISTCONTROL=ignoreboth  # (ignoredups and ignorespace)

# Vim is THE editor!
export VISUAL=vim
export EDITOR=vim

# For Python (virtualenv and pip)
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
export WORKON_HOME=$HOME/.virtualenvs
if which virtualenvwrapper.sh > /dev/null 2>&1; then
    if [ ! -e $WORKON_HOME ]; then
        mkdir $WORKON_HOME
    fi
    export VIRTUALENVWRAPPER_PYTHON="$(which python)"
    export PIP_VIRTUALENV_BASE="$WORKON_HOME"
    source `which virtualenvwrapper.sh`
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Completion
if [ -f ~/.bash_completion ]; then
    . ~/.bash_completion
fi

# Local settings
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
