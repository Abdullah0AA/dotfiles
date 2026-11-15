# Servers

Zsh setup for Ubuntu servers. [`zsh/.zshrc`](../zsh/.zshrc) is the configuration; the fish
configuration in `fish/` is for my PC.

## Shell setup

- Pure prompt with orange user, host, path, and prompt colors.
- fzf-tab for fuzzy Tab completion; fzf shortcuts for history (Ctrl-R), files
  (Ctrl-T), and directories (Alt-C).
- Autosuggestions and syntax highlighting.
- GitHub CLI (`gh`) and uv subcommand and option completion, loaded when installed.
- Shared 100,000-entry history, prefix search with the arrow keys, and a directory stack.
- zoxide replaces `cd`; `cdi` opens its interactive directory picker.
- `fd` aliases `fdfind`; `ls` uses an eza long listing; `lt` uses an eza tree
  respecting Git ignores.

## Packages

```sh
sudo apt update
sudo apt install zsh git curl stow eza zoxide fzf bat ripgrep fd-find \
  btop htop tmux jq ncdu wget rsync gh
```

The configuration needs fzf 0.48 or newer for `fzf --zsh`. On Ubuntu, `bat` is installed as `batcat`.

## Zsh plugins

Clone the plugins into the paths `.zshrc` expects:

```sh
mkdir -p ~/.zsh
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
git clone https://github.com/Aloxaf/fzf-tab.git ~/.zsh/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
```

## Install the configuration

Put machine-specific paths and runtime setup (such as Vite+, Bun, and opencode) in
`~/.zshrc.local`. The shared configuration loads it last; keep it out of the repository.

From the repository root:

```sh
# Stow won't replace an existing file; back it up first.
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.backup-"$(date +%Y%m%d-%H%M%S)"
fi
stow zsh
chsh -s "$(command -v zsh)"
```

Open a new login session to use Zsh.
