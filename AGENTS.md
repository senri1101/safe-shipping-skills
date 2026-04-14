# Agent Instructions

This repository contains reusable prompts and skill packages for multiple AI coding tools.

## Source Of Truth

- Treat `skills/` as the canonical content.
- Do not fork logic across tool-specific files unless the target tool requires a different entrypoint format.
- If guidance conflicts, prefer the files inside `skills/<skill-name>/` for workflow details.

## Editing Expectations

- Keep instructions practical and review-oriented.
- Optimize for reuse across repositories and teams.
- Keep shared logic in plain Markdown.
- Keep long enumerations in `references/` instead of inflating top-level prompts.

## Compatibility Goal

Changes in this repo should remain usable for:

- Codex skill folders
- Claude Code project memory and slash commands
- GitHub Copilot repository and agent instructions
