# Dotfiles

My personal workstation and server dotfiles.

## Layout

Each folder is one program, laid out the way its files sit in my home directory. [GNU Stow](https://www.gnu.org/software/stow/) links a folder's files into place:

```sh
git clone https://github.com/Abdullah0AA/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow fish bin claude codex   # my PC
stow zsh claude codex        # a server
```

* `fish/` -> Fish shell configuration, for my PC
* `bin/` -> my scripts in `~/.local/bin`, such as `vscode-update` (Microsoft's VS Code build)
* `zsh/` -> Zsh configuration, for servers. See [docs/servers.md](docs/servers.md).
* `codex/` -> `~/.codex/AGENTS.md`, my global instructions for coding agents
* `claude/` -> `~/.claude/CLAUDE.md`, which imports the same instructions
* `agent-tools/` -> install scripts for tools agents use. Run them, don't stow them.

Stow refuses to replace a real file, so move an existing one out of the way first.

## Installation

### System Tools

```bash
sudo dnf install \
  fish \
  zoxide \
  eza \
  fzf \
  bat \
  ripgrep \
  fd-find \
  git-delta \
  direnv \
  pgcli \
  mycli
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

## Agents

```bash
curl -fsSL https://claude.ai/install.sh | bash          # Claude Code
curl -fsSL https://chatgpt.com/codex/install.sh | sh    # Codex
curl -fsSL https://opencode.ai/install | bash           # opencode
```

Each command also updates its agent when run again.

## Agent tools

[`agent-tools/`](agent-tools/) holds a script per tool that agents use, each safe to re-run. They aren't Stow folders.

* [`playwright-cli.sh`](agent-tools/playwright-cli.sh) -> browser automation: the CLI and its skills for Codex and Claude Code. Needs Vite+.

## Skills

```bash
vpx skills add resend/resend-skills
vpx skills add resend/email-best-practices
```

Choose **Global** scope and select the agents to install to.

## Agent Instructions

[`codex/.codex/AGENTS.md`](codex/.codex/AGENTS.md) holds my global instructions for coding agents. Codex reads it directly. Claude Code reads `CLAUDE.md` instead, so [`claude/.claude/CLAUDE.md`](claude/.claude/CLAUDE.md) imports it with `@~/.codex/AGENTS.md`.

Run `/memory` in a Claude Code session to check that it loaded.

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
