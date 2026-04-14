# safe-shipping-skills

Practical Codex skills for reviewing software before it ships.

This repository is inspired by Akira Isegawa's article on the minimum discipline needed before releasing AI-assisted software.

## Goals

- Share reusable Codex skills through GitHub
- Make engineering review easier for internal teams
- Turn broad best-practice checklists into actionable review workflows

## Included Skills

### `project-readiness-check`

A review-first skill for checking a project across:

- security
- secrets management
- authorization and tenant isolation
- legal, privacy, and license risk
- cost guardrails
- data and transaction design
- test strategy
- release and operational readiness

It works from planning through production and returns structured results using:

- `Pass`
- `Warning`
- `Blocker`
- `N/A`

## Repository Layout

```text
skills/
  project-readiness-check/
    SKILL.md
    agents/openai.yaml
    references/
```

## How To Use

1. Clone this repository.
2. Copy the desired skill directory into your local Codex skills directory.
3. Invoke the skill explicitly, for example:

```text
Use $project-readiness-check to assess this repository before release.
```

## Current Direction

This repository starts with one core skill and is structured so it can later expand into narrower skills such as:

- design-readiness-check
- code-change-check
- release-readiness-check
