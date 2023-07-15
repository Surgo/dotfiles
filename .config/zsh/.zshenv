export LANG=ja_JP.UTF-8

# Vim THE editor!
export VISUAL=vim
export EDITOR=vim

if type brew &>/dev/null; then
  # Setup path
  # brew --prefix is too slow
  # https://github.com/Homebrew/brew/issues/3327
  export HOMEBREW_PREFIX="$(dirname $(dirname $(which brew)))"
fi

# Path
if [ -f "${HOME}/.sh_path" ]; then
  source "${HOME}/.sh_path"
fi
# My configurations.
if [ -f "${HOME}/.sh_mine" ]; then
  source "${HOME}/.sh_mine"
fi
# Local settings
if [ -f "${HOME}/.sh_local" ]; then
  source "${HOME}/.sh_local"
fi
