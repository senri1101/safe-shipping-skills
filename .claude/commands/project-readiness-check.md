---
description: 現在のリポジトリや指定された対象に対して project-readiness-check を実行します。
---

`.claude/skills/project-readiness-check/SKILL.md` を Claude Code の入口として使ってください。

実行内容:
- `project-readiness-check` のワークフローを実行する
- 最初にプロジェクトプロファイルを埋める
- 断定する前にローカルの証拠を確認する
- まず Hard Gates、その後に Stage Gates を判定する
- 深掘り質問は不確実な箇所や失敗している箇所にだけ使う
- `references/report-template.md` に沿った Markdown レポートを返す

対象や追加コンテキスト: $ARGUMENTS
