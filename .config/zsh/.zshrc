# Paths for Oh My Zsh
ZSH="${ZDOTDIR:-$HOME}/ohmyzsh"
ZSH_CUSTOM="${ZDOTDIR:-$ZSH}/custom"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Configure plugins
## Oh My Zsh
DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=true
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_FIXTERM=true
ZSH_TMUX_CONFIG="${XDG_CONFIG_HOME:-$HOME}/tmux/tmux.conf"
ZSH_TMUX_UNICODE=true

HISTORY_BASE="${XDG_CACHE_HOME}/directory_history"

## zsh-autosuggestions
ZSH_AUTOSUGGEST_MANUAL_REBIND=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=black,bg=blue,bold,underline"

## python
PYTHON_AUTO_VRUN=true
PYTHON_VENV_NAME=".venv"

# Plugins
plugins=()
## OS specific
case "${OSTYPE}" in
  darwin*)
    plugins+=(brew keychain macos)
  ;;
  linux*)
    plugins+=(systemd)
  ;;
esac
## Utilities
plugins+=(1password aliases command-not-found direnv dotenv per-directory-history sudo)
## Colorize
plugins+=(colored-man-pages colorize)
## Devtools
plugins+=(tmux vscode)
plugins+=(docker docker-compose)
plugins+=(git gitfast gitignore gh tig)
plugins+=(mercurial)
plugins+=(aws gcloud terraform)
plugins+=(autopep8 pep8 pip python uv)
plugins+=(bundler gem rails rake rbenv ruby)
plugins+=(bun deno node npm nvm yarn)
plugins+=(golang)
## Apps
plugins+=(1password)
## External
plugins+=(zsh-autosuggestions zsh-syntax-highlighting)
### https://github.com/zsh-users/zsh-completions/issues/603
fpath=("${ZSH_CUSTOM}/plugins/zsh-completions/src" $fpath)
source "${ZSH}/oh-my-zsh.sh"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f "${ZDOTDIR:-$HOME}/.p10k.zsh" ]] || source "${ZDOTDIR:-$HOME}/.p10k.zsh"
