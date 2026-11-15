# Personal executables
typeset -U path
path=("$HOME/.local/bin" $path)

# Persistent history, shared between terminal sessions
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# Directory navigation: bare paths, a directory stack, and cd -
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT
DIRSTACKSIZE=20

# Completion for commands, options, paths, and Git branches
fpath+=("$HOME/.zsh/pure")
autoload -Uz compinit
compinit

# GitHub CLI completion
if (( $+commands[gh] )); then
  eval "$(gh completion -s zsh)"
fi

# uv completion
if (( $+commands[uv] )); then
  eval "$(uv generate-shell-completion zsh)"
fi
zmodload zsh/complist
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'

# Emacs editing keys and prefix history search
bindkey -e
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^?' backward-delete-char

# fzf: Ctrl-R history, Ctrl-T files, Alt-C directories, and **<Tab>
if (( $+commands[fzf] )); then
  eval "$(fzf --zsh)"
fi

# Use zoxide as cd; cdi opens the interactive directory picker
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh --cmd cd)"
fi

# Pure prompt
autoload -U promptinit
promptinit
zstyle ':prompt:pure:path' color '#faaa3c'
zstyle ':prompt:pure:user' color '#f38020'
zstyle ':prompt:pure:host' color '#f38020'
zstyle ':prompt:pure:git:branch' color '#a6a6a6'
zstyle ':prompt:pure:prompt:success' color '#f38020'
zstyle ':prompt:pure:prompt:error' color '#ff3333'
prompt pure

# Fuzzy selection for regular Tab completion
source "$HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh"

# Right arrow accepts a history suggestion at the end of the line
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"


# File search and listings
alias fd=fdfind

ls() {
  eza -lh --group-directories-first --icons=auto "$@"
}

lt() {
  eza --tree --git-ignore --icons=auto --group-directories-first "$@"
}

# Load highlighting after all widgets and key bindings
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if [[ -f "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
