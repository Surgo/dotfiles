# Setup path
if [ -f ~/.sh_path ]; then
  . ~/.sh_path
fi

LANG=ja_JP.UTF-8

ZSH=${HOME}/.ohmyzsh
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
    plugins=($plugins macos brew) # For Mac OSX
  ;;
  linux*)
    plugins=($plugins common-aliases compleat) # For Linux
  ;;
esac
plugins=($plugins ag docker docker-compose tmux) # For dev tools
plugins=($plugins ansible aws terraform) # For ops
plugins=($plugins redis-cli) # For maint servers
plugins=($plugins git gitfast tig) # For Git
plugins=($plugins mercurial) # For Mercurial
plugins=($plugins autopep8 pep8 pip python virtualenv) # For Python
plugins=($plugins bundler gem rake ruby) # For Ruby
plugins=($plugins node npm yarn) # For JavaScript
plugins=($plugins golang) # For Go

# Load "Oh-My-ZSH!"
source ${ZSH}/oh-my-zsh.sh

# Completion files
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:${FPATH}

  autoload -Uz compinit
  compinit
fi

# Help files
if type brew &>/dev/null; then
  HELPDIR=$(brew --prefix)/share/zsh/helpfiles
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
