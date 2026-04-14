# safe-shipping-skills

This repository stores reusable AI workflow assets that should remain tool-agnostic at the core and tool-specific only at the edges.

## Repository Intent

- `skills/` is the canonical source for reusable review workflows.
- Each skill should stay portable across tools.
- Tool-specific entrypoints should live outside the skill itself when possible.

## Editing Rules

- Preserve skill frontmatter fields such as `name` and `description`.
- Keep `SKILL.md` concise and workflow-oriented.
- Move detailed checklists, templates, and long catalogs into `references/`.
- Avoid duplicating the same guidance across `SKILL.md` and `references/`.
- Prefer adding new reference files over bloating a single root prompt.

## Expected Skill Layout

```text
skills/<skill-name>/
  SKILL.md
  agents/openai.yaml
  references/
```

Optional directories may be added when justified, but do not add extra files by default.

## Cross-tool Compatibility

- Codex: keep the skill directory directly portable into `~/.codex/skills/`.
- Claude Code: keep project-level guidance in this `CLAUDE.md` and reusable commands in `.claude/commands/`.
- GitHub Copilot: keep repository-wide guidance in `.github/copilot-instructions.md` and agent-oriented guidance in `AGENTS.md`.

## When Adding Or Updating A Skill

1. Update the canonical files in `skills/<skill-name>/` first.
2. Only add tool-specific wrappers if they improve usability.
3. Keep naming stable so downstream users can copy the directory without edits.
4. Prefer Markdown outputs and plain-text templates unless a binary asset is required.
