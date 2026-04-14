# Tool Compatibility

This repository is structured so one skill can be reused across Codex, Claude Code, and GitHub Copilot.

## Codex

Canonical location:
- `skills/<skill-name>/`

Typical installation:
1. Copy `skills/<skill-name>/` into `~/.codex/skills/<skill-name>/`
2. Invoke the skill explicitly in Codex

Example:
```text
Use $project-readiness-check to assess this repository before release.
```

## Claude Code

Repository support files:
- `CLAUDE.md`
- `.claude/commands/project-readiness-check.md`

How to use:
- Open the repository in Claude Code.
- Claude reads `CLAUDE.md` as project memory.
- Run `/project-readiness-check` to execute the workflow wrapper.

## GitHub Copilot

Repository support files:
- `.github/copilot-instructions.md`
- `.github/instructions/skills.instructions.md`
- `AGENTS.md`
- `CLAUDE.md`

How it applies:
- Copilot Chat can use `.github/copilot-instructions.md` as repository-wide context.
- Copilot coding agent and code review can also use path-specific instructions and agent instructions.
- The actual reusable workflow content still lives in `skills/`.

## Design Principle

- Keep the reusable workflow in one canonical place.
- Add thin wrappers for each tool rather than maintaining separate versions of the same skill.
- Prefer stable file and folder names so teams can automate installation later.
