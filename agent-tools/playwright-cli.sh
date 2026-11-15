#!/usr/bin/env bash
# Browser automation for agents: the playwright-cli command and its skills for Codex and Claude
# Code. It downloads a browser on first use. Safe to re-run; it also updates everything.
set -euo pipefail

command -v vp > /dev/null || { echo "playwright-cli.sh: needs Vite+ (vp) on PATH" >&2; exit 1; }

vp add -g @playwright/cli@latest

playwright-cli install --skills=agents -g # Codex
playwright-cli install --skills=claude -g # Claude Code

echo "Restart Codex and Claude Code to pick up the skills."
