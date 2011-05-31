# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source `which virtualenvwrapper.sh`
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true

# Completion git & mercurial
export BASH_COMPLETION_DIR=/opt/local/etc/bash_completion.d
    . $BASH_COMPLETION_DIR/git
    . $BASH_COMPLETION_DIR/mercurial

# View git & mercurial brach
# prompt command
hg_branch() {
  hg branch 2> /dev/null | awk '{print "(hg:" $1 ")"}'
}
git_branch() {
  __git_ps1 '(git:%s)'
}
# setting for prompt
if [ -f $BASH_COMPLETION_DIR/git ]; then
  source $BASH_COMPLETION_DIR/git
  echo "git-completion enabled..."
  PS1="\[\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \$(git_branch)\$(hg_branch) \[\033[0;32m\]\w\[\033[0;37m\]]\n\$ "
else
  PS1="\[\033[0;37m\][\[\033[0;32m\]\t \[\033[1;36m\]\u\[\033[0;37m\]@\h \[\033[0;32m\]\w\[\033[0;37m\]]\n\$ "
fi
export PS1
