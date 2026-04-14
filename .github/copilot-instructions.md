# GitHub Copilot Instructions

This repository stores reusable AI workflow assets.

## General Rules

- Treat `skills/` as the canonical source of reusable review workflows.
- Preserve the folder layout of each skill so users can copy it directly into their own environments.
- Keep `SKILL.md` concise and move detailed material into `references/`.
- Avoid duplicating the same instruction across multiple files unless the target tool requires a wrapper.
- Prefer edits that improve portability across Codex, Claude Code, and GitHub Copilot.

## Skill Authoring Rules

- Preserve YAML frontmatter in `SKILL.md`.
- Keep `name` stable unless a rename is explicitly intended.
- Keep `description` focused on what the skill does and when to use it.
- Store long checklists, templates, and question banks under `references/`.
- Use plain Markdown unless a specific tool requires a different format.

## Repository Goal

When adding or editing content, optimize for:

- review-first workflows
- reusable team distribution
- low-friction installation into tool-specific environments
