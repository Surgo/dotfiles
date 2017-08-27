export LANG=ja_JP.UTF-8

# Completion files
if [ -f /opt/homebrew/share/zsh-completions ]; then
  fpath=(/opt/homebrew/share/zsh-completions $fpath)
fi

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
plugins=($plugins python pep8 pip django) # For Python
plugins=($plugins go) # For Go

# Use brew helpfiles
if [ -d /opt/homebrew/gcshare/zsh/helpfiles ]; then
  unalias run-help
  autoload run-help
  HELPDIR=/opt/homebrew/gcshare/zsh/helpfiles
fi

# Load "Oh-My-ZSH!"
source $ZSH/oh-my-zsh.sh

function get_vcs_prompt_info {
  if [ $(in_hg) ]; then
    echo $(hg_prompt_info)
  else
    echo $(git_prompt_info)
  fi
}

# Override robbyrussell PROMPT
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(get_vcs_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
ZSH_THEME_HG_PROMPT_PREFIX="hg:(%{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_HG_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_HG_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN
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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
