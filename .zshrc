# Setup path
BREW_PATH=/opt/homebrew
if [ -f ~/.sh_path ]; then
  . ~/.sh_path
fi

LANG=ja_JP.UTF-8

ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="yyyy-mm-dd"

# Congifure plugins
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true

# Load plugins
plugins=(sudo colorize) # OS common
case ${OSTYPE} in
  darwin*)
    plugins=($plugins osx brew) # For Mac OSX
  ;;
  linux*)
    plugins=($plugins common-aliases compleat) # For Linux
  ;;
esac
plugins=($plugins tmux vagrant docker) # For dev tools
plugins=($plugins redis-cli) # For maint servers
plugins=($plugins git gitfast tig) # For Git
plugins=($plugins mercurial) # For Mercurial
plugins=($plugins python pep8 pip django virtualenv) # For Python
plugins=($plugins golang) # For Go

# Load "Oh-My-ZSH!"
source ${ZSH}/oh-my-zsh.sh

# Completion files
if [ -d ${BREW_PATH}/share/zsh-completions ]; then
  fpath=(${BREW_PATH}/share/zsh-completions ${fpath})
fi

# Help files
if [ -d ${BREW_PATH}/share/zsh/help ]; then
  HELPDIR=${BREW_PATH}/share/zsh/helpfiles
fi

# Override robbyrussell PROMPT
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)$(hg_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# My configurations.
if [ -f ~/.sh_mine ]; then
  . ~/.sh_mine
fi
# Local settings
if [ -f ~/.sh_local ]; then
  . ~/.sh_local
fi
