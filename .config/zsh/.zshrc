# Paths for Oh My Zsh
ZSH="${ZDOTDIR:-$HOME}/ohmyzsh"
ZSH_CUSTOM="${ZDOTDIR:-$ZSH}/custom"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Configure plugins
## Oh My Zsh
DISABLE_AUTO_UPDATE=true
ZSH_TMUX_AUTOSTART=true
## zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=black,bg=blue,bold,underline"

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
plugins+=(aliases command-not-found per-directory-history sudo)
## Colorize
plugins+=(colored-man-pages colorize)
## Devtools
plugins+=(ag tmux vscode)
plugins+=(docker docker-compose)
plugins+=(git gitfast gitignore tig)
plugins+=(mercurial)
plugins+=(ansible aws gcloud terraform)
plugins+=(autopep8 pep8 pip poetry python virtualenv)
plugins+=(bundler gem rails rake rbenv ruby)
plugins+=(node nodenv npm yarn)
plugins+=(golang)
## External
plugins+=(zsh-autosuggestions zsh-syntax-highlighting)
### https://github.com/zsh-users/zsh-completions/issues/603
fpath+="${ZSH_CUSTOM}/plugins/zsh-completions/src"
source "${ZSH}/oh-my-zsh.sh"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
