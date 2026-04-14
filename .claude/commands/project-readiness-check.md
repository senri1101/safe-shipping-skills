---
description: Run the project-readiness-check workflow against the current repository or provided target.
---

Use `.claude/skills/project-readiness-check/SKILL.md` as the Claude Code entrypoint.
If you are using this repository directly, that skill will in turn refer to the canonical files under `skills/project-readiness-check/`.

Task:
- Run the `project-readiness-check` workflow.
- Start by filling the project profile.
- Inspect local evidence before making claims.
- Evaluate hard gates first, then stage gates.
- Use deep-dive questions only for uncertain or failing areas.
- Return a Markdown report that follows `skills/project-readiness-check/references/report-template.md`.

Target or extra context: $ARGUMENTS
