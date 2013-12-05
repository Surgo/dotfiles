# General
alias ls='ls -G'
alias ll='ls -alFh'
alias la='ls -AFh'
alias l='ls -CF'

alias recent='ls -lAt | head'
alias old='ls -lAt | tail'

alias pip='hash -r && pip'
alias vi='hash -r && vi'
alias vim='hash -r && vim'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# For the lulz
alias bitch,=sudo

# Local settings
if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi
