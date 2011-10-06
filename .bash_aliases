# Python selector
alias py-25="sudo port select --set python python25"
alias py-26="sudo port select --set python python26"
alias py-27="sudo port select --set python python27"
alias py-ls="port select --list python"

# For the lulz
alias bitch,=sudo

# Local settings
if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi
