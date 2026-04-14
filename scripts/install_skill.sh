#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: bash scripts/install_skill.sh <codex|claude|copilot|all> <skill-name> [repo-root]" >&2
  exit 1
fi

tool="$1"
skill_name="$2"
repo_root="${3:-$(cd "$(dirname "$0")/.." && pwd)}"
skill_dir="$repo_root/skills/$skill_name"

if [ ! -d "$skill_dir" ]; then
  echo "Skill not found: $skill_dir" >&2
  exit 1
fi

install_codex() {
  local target="$HOME/.codex/skills/$skill_name"
  mkdir -p "$HOME/.codex/skills"
  rm -rf "$target"
  cp -R "$skill_dir" "$target"
  echo "Installed Codex skill: $target"
}

install_claude() {
  local source="$repo_root/.claude/commands/$skill_name.md"
  local target_dir="$HOME/.claude/commands"
  if [ ! -f "$source" ]; then
    echo "Claude command not found: $source" >&2
    exit 1
  fi
  mkdir -p "$target_dir"
  cp "$source" "$target_dir/$skill_name.md"
  echo "Installed Claude Code command: $target_dir/$skill_name.md"
}

print_copilot() {
  cat <<MSG
GitHub Copilot does not install a local skill directory.
Use this repository directly and rely on:
- .github/copilot-instructions.md
- .github/instructions/
- AGENTS.md
MSG
}

case "$tool" in
  codex)
    install_codex
    ;;
  claude)
    install_claude
    ;;
  copilot)
    print_copilot
    ;;
  all)
    install_codex
    install_claude
    print_copilot
    ;;
  *)
    echo "Unknown tool: $tool" >&2
    exit 1
    ;;
esac
