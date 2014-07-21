ZSH=$HOME/.oh-my-zsh
# Setup path
if [ -f ~/.sh_path ]; then
    . ~/.sh_path
fi

ZSH_THEME="robbyrussell"
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"

# CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# DISABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# Completion files
if [ -f /usr/local/share/zsh/functions ]; then
  fpath=(/usr/local/share/zsh/functions $fpath);
fi
if [ -f /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath);
fi

# Congifure plugins
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true

# Load plugins
plugins=(sudo colorize) # OS common
case ${OSTYPE} in
  darwin*)
    plugins=($plugins osx brew brew-cask) # For Mac OSX
  ;;
  linux*)
    plugins=($plugins common-aliases compleat) # For Linux
  ;;
esac
plugins=($plugins tmux mosh vagrant fabric docker) # For dev tools
plugins=($plugins jira github) # For dev service
plugins=($plugins redis-cli supervisor) # For maint servers
plugins=($plugins git gitignore gitfast git-flow git-hubflow) # For Git
plugins=($plugins mercurial) # For Mercurial
plugins=($plugins python pep8 pip virtualenvwrapper django) # For Python
plugins=($plugins go) # For Go

# Use brew helpfiles
if [ -d /usr/local/share/zsh/helpfiles ]; then
  unalias run-help
  autoload run-help
  HELPDIR=/usr/local/share/zsh/helpfiles
fi

# Load "Oh-My-ZSH!"
source $ZSH/oh-my-zsh.sh

# My configurations.
if [ -f ~/.sh_mine ]; then
  . ~/.sh_mine
fi
# Local settings
if [ -f ~/.sh_local ]; then
  . ~/.sh_local
fi
# My completion
if [ -f ~/.zsh_completion ]; then
  . ~/.zsh_completion
fi
