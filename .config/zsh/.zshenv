export LANG=ja_JP.UTF-8

# Vim THE editor!
export VISUAL=vim
export EDITOR=vim

# Homebrew
if type brew &>/dev/null; then
  # Setup path
  # brew --prefix is too slow
  # https://github.com/Homebrew/brew/issues/3327
  export HOMEBREW_PREFIX="$(dirname $(dirname $(which brew)))"
fi

# Load additional files
if [ -f "${XDG_CONFIG_HOME:-$HOME}/sh/profile" ]; then
  source "${XDG_CONFIG_HOME:-$HOME}/sh/profile"
fi
if [ -f "${XDG_CONFIG_HOME:-$HOME}/sh/functions" ]; then
  source "${XDG_CONFIG_HOME:-$HOME}/sh/functions"
fi
if [ -f "${XDG_CONFIG_HOME:-$HOME}/sh/aliases" ]; then
  source "${XDG_CONFIG_HOME:-$HOME}/sh/aliases"
fi
if [ -f "${XDG_CONFIG_HOME:-$HOME}/sh/local" ]; then
  source "${XDG_CONFIG_HOME:-$HOME}/sh/local"
fi
