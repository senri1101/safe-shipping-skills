---
name: project-readiness-check
description: Claude Code で project-readiness-check を実行するための入口。実際のワークフロー本体は skills/project-readiness-check/ を参照する。
---

# Project Readiness Check

Claude Code では、このファイルを skill の入口として使います。

## Source Of Truth

実際のワークフロー本体は次の canonical files です。

- `skills/project-readiness-check/SKILL.md`
- `skills/project-readiness-check/references/project-profile.md`
- `skills/project-readiness-check/references/hard-gates.md`
- `skills/project-readiness-check/references/stage-gates.md`
- `skills/project-readiness-check/references/appendix-index-map.md`
- `skills/project-readiness-check/references/deep-dive-index.md`
- `skills/project-readiness-check/references/report-template.md`

## What To Do

1. まず `project-profile.md` を使ってプロジェクトプロファイルを埋める。
2. repo や仕様がある場合は、先にローカル探索で事実を集める。
3. `hard-gates.md` で常時必須の観点を先に判定する。
4. `stage-gates.md` で現在段階に応じた観点を追加で判定する。
5. まず `appendix-index-map.md` で関係しそうな章を選ぶ。
6. `deep-dive-index.md` は Warning / Blocker が出た箇所だけに使う。
7. `report-template.md` に沿って Markdown レポートを返す。

## Output

必ず次を含む Markdown レポートを返します。

- `Project Profile`
- `Overall Verdict`
- `Blockers`
- `Warnings`
- `Category Results`
- `Required Next Actions`
- `Optional Deep Dives`
