---
name: project-readiness-check
description: Claude Code で project-readiness-check を実行するための入口。Claude 用に必要なリファレンスを同梱した自己完結版です。
---

# Project Readiness Check

Claude Code では、このディレクトリを skill の入口として使います。

## 使い方

1. まず `references/project-profile.md` を使ってプロジェクトプロファイルを埋める。
2. repo や仕様がある場合は、先にローカル探索で事実を集める。
3. `references/hard-gates.md` で常時必須の観点を先に判定する。
4. `references/stage-gates.md` で現在段階に応じた観点を追加で判定する。
5. `references/appendix-index-map.md` で関係しそうな章を選ぶ。
6. `references/deep-dive-index.md` は Warning / Blocker が出た箇所だけに使う。
7. `references/report-template.md` に沿って Markdown レポートを返す。

## 出力要件

必ず次を含む Markdown レポートを返します。

- `Project Profile`
- `Overall Verdict`
- `Blockers`
- `Warnings`
- `Category Results`
- `Required Next Actions`
- `Optional Deep Dives`
