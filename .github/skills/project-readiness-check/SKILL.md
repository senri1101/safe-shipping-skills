---
name: project-readiness-check
description: Use the canonical project-readiness-check workflow from the repository skills folder for GitHub Copilot agent tasks.
---

# Project Readiness Check

Use `skills/project-readiness-check/SKILL.md` and the files under `skills/project-readiness-check/references/` as the source of truth.

## When To Use

- You need to review a repository or specification before release.
- You want a structured verdict across security, cost, legal, test, and operational readiness.
- You want results in `Pass / Warning / Blocker / N/A` form.

## Steps

1. Fill the project profile using `skills/project-readiness-check/references/project-profile.md`.
2. Inspect local evidence before making claims.
3. Evaluate hard gates first using `skills/project-readiness-check/references/hard-gates.md`.
4. Evaluate stage gates using `skills/project-readiness-check/references/stage-gates.md`.
5. Use `skills/project-readiness-check/references/deep-dive-index.md` only for uncertain or failing areas.
6. Return a Markdown report matching `skills/project-readiness-check/references/report-template.md`.
