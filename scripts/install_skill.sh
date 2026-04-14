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
  echo "Official-first option: use \"$skill-installer install <GitHub directory URL>\" inside Codex when available."
}

install_claude() {
  local skill_source="$repo_root/.claude/skills/$skill_name"
  local command_source="$repo_root/.claude/commands/$skill_name.md"
  local skill_target="$HOME/.claude/skills/$skill_name"
  local command_target_dir="$HOME/.claude/commands"

  if [ ! -d "$skill_source" ]; then
    echo "Claude skill not found: $skill_source" >&2
    exit 1
  fi

  if [ ! -f "$command_source" ]; then
    echo "Claude command not found: $command_source" >&2
    exit 1
  fi

  mkdir -p "$HOME/.claude/skills" "$command_target_dir"
  rm -rf "$skill_target"
  cp -R "$skill_source" "$skill_target"
  cp "$command_source" "$command_target_dir/$skill_name.md"
  echo "Installed Claude Code skill: $skill_target"
  echo "Installed Claude Code command: $command_target_dir/$skill_name.md"
  echo "Official-first option: open this repository directly so Claude Code can use project memory, skills, and commands in place."
}

install_copilot() {
  local target="$HOME/.copilot/skills/$skill_name"
  mkdir -p "$HOME/.copilot/skills"
  rm -rf "$target"
  cp -R "$skill_dir" "$target"
  echo "Installed GitHub Copilot skill: $target"
  echo "Official-first option: open this repository directly and use .github/skills plus repository instructions."
}

case "$tool" in
  codex)
    install_codex
    ;;
  claude)
    install_claude
    ;;
  copilot)
    install_copilot
    ;;
  all)
    install_codex
    install_claude
    install_copilot
    ;;
  *)
    echo "Unknown tool: $tool" >&2
    exit 1
    ;;
esac
