# Dotfiles

My personal workstation and server dotfiles.

## Layout

Each folder is one program, laid out the way its files sit in my home directory. [GNU Stow](https://www.gnu.org/software/stow/) links a folder's files into place:

```sh
git clone https://github.com/Abdullah0AA/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow fish bin   # my PC
stow zsh        # a server
```

* `fish/` -> Fish shell configuration, for my PC
* `bin/` -> my scripts in `~/.local/bin`, such as `vscode-update` (Microsoft's VS Code build)
* `zsh/` -> Zsh configuration, for servers. See [docs/servers.md](docs/servers.md).

Stow refuses to replace a real file, so move an existing one out of the way first.

## Installation

### System Tools

For CachyOS:

```bash
sudo pacman -S --needed fish zoxide eza fzf bat ripgrep fd git-delta direnv pgcli stow
sudo pacman -S --needed go gopls delve
uv tool install mycli  # not in the official repos; needs uv, see below
```

### Editor

#### [Zed](https://zed.dev/) -> Primary code editor

```bash
curl -f https://zed.dev/install.sh | sh
```

### [Fish](https://fishshell.com/)

Set Fish as the default shell:

```bash
chsh -s "$(which fish)"
```

Log out and back in for the change to take effect.

### Language & Runtime Tooling

#### [Vite+](https://viteplus.dev/) -> Unified web development toolchain. It also manages node versions.

```bash
curl -fsSL https://vite.plus | bash
```

#### [uv](https://docs.astral.sh/uv/) -> Python package, project, and runtime manager

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

#### [Bun](https://bun.com/docs) -> JavaScript runtime and toolkit

```bash
curl -fsSL https://bun.com/install | bash
```

## CLI Setup

The shell configuration uses:

* [**zoxide**](https://github.com/ajeetdsouza/zoxide) -> smarter directory navigation
* [**eza**](https://eza.rocks/) -> modern file listing
* [**ripgrep (`rg`)**](https://github.com/BurntSushi/ripgrep) -> fast recursive text search
* [**fd**](https://github.com/sharkdp/fd) -> fast file and directory search
* [**bat**](https://github.com/sharkdp/bat) -> syntax-highlighted file viewing
* [**fzf**](https://github.com/junegunn/fzf) -> fuzzy finding and interactive selection
* [**direnv**](https://direnv.net/) -> per-directory environment variables
* [**delta**](https://dandavison.github.io/delta/) -> enhanced Git diff rendering
* [**pgcli**](https://www.pgcli.com/) -> PostgreSQL CLI
* [**mycli**](https://www.mycli.net/) -> MySQL CLI
