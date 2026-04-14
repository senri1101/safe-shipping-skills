---
name: project-readiness-check
description: AIで作ったアプリや機能の安全性・品質・運用準備を、企画前から運用中まで網羅的に点検するSkill。設計レビュー、コードレビュー、リリース前チェックで、セキュリティ、コスト、法務、データ設計、テスト、運用の抜け漏れを確認したいときに使う。
---

# Project Readiness Check

## 目的

AI併用開発のプロジェクトを、実務で問題になる観点からレビューする。
仕様しかない段階でも使えるが、repo や設定がある場合は先に探索し、事実ベースで `Pass / Warning / Blocker / N/A` を付ける。

## いつ使うか / 使わないか

使う:
- 企画前に「そもそも出してよいか」を判定したいとき
- 設計レビュー、コードレビュー、リリース前チェックをまとめてやりたいとき
- セキュリティ、法務、コスト、データ設計、テスト、運用の漏れを短時間で洗いたいとき
- AI が書いたコードや構成を、公開前に人間の観点で点検したいとき

使わない:
- 単一バグ修正や小さな UI 調整だけを確認したいとき
- ある 1 分野だけを深掘りしたいとき
  - 状態設計だけなら `$state-design-review`
  - QA 引き継ぎ資料だけなら `$release-qa-handoff`

## 最小入力

- 対象の repo、仕様、PR、または設計メモ
- 現在段階: `企画 / 設計 / 実装 / リリース前 / 運用中`
- 公開範囲と利用者
- 扱うデータの種類
- 実行基盤と外部サービス

入力が不足していても始めてよい。その場合は、まずローカル探索で事実を拾い、不足している根拠だけを明示する。

## 最初に確定するプロジェクトプロファイル

レビュー開始時に、必ず `references/project-profile.md` のテンプレートを埋める。
固定項目は以下。

- プロジェクト種別: `使い捨て / 継続運用`
- 公開範囲: `個人用 / 社内 / 限定公開 / 一般公開`
- 扱うデータ: `なし / 内部情報 / 個人情報 / 決済・規制対象`
- 認証・認可・マルチテナント有無
- 変動課金サービス有無
- 実行基盤: `SaaS builder / PaaS / IaaS / ローカルのみ`
- AI/LLM 利用有無
- 現在段階: `企画 / 設計 / 実装 / リリース前 / 運用中`

repo や仕様がある場合は、まず以下を探索して事実を埋める。
- secrets 管理
- lock file
- 認証 / 認可
- migration
- tests
- CI
- infra 設定
- logging / monitoring 設定

## 実施フロー

1. `references/project-profile.md` を使って、プロジェクトプロファイルを確定する。
2. repo や仕様がある場合は先に探索し、憶測ではなく証拠を集める。
3. `references/hard-gates.md` で常時必須の観点を先に判定する。
4. `references/stage-gates.md` から現在段階に対応する gate を選び、追加判定する。
5. まず `references/appendix-index-map.md` で関係しそうな章を選ぶ。
6. 判定が揺れる箇所、Warning / Blocker が出た箇所だけ `references/deep-dive-index.md` の質問で深掘りする。
7. `references/report-template.md` の形式で、総合判定、根拠、未解決事項、次アクションをまとめる。

## 判定ルール

カテゴリ判定:
- `Pass`: 必要な対策が実装済みで、証拠がある
- `Warning`: 重大事故には直結しないが、未整備・未検証・未文書化が残る
- `Blocker`: 公開、共有、本番運用の前に止めるべき欠落がある
- `N/A`: そのプロジェクト形態では無関係

証拠不足の扱い:
- `security / privacy / legal / runaway cost / backup欠如 / env未分離 / authz欠如` は、証拠が出せなければ原則 `Blocker`
- `性能見積り / UX / docs / 一部テスト不足` は通常 `Warning`
- 無関係であることを説明できる場合だけ `N/A`

総合判定:
- `Prototype Only`: 使い捨て前提でのみ許容。共有運用には未達
- `Internal Limited Use`: 限定公開や社内利用なら検討可能だが、外部公開前に是正が必要
- `Release Candidate With Fixes`: Hard Gate の致命傷はないが、是正付きでのみリリース候補
- `Release Ready`: Blocker なし。運用・監視・ロールバックまで成立

## 出力要件

出力は必ず Markdown レポートで返す。最低限含めるものは以下。

- `Project Profile`
- `Overall Verdict`
- `Blockers`
- `Warnings`
- `Category Results`
- `Required Next Actions`
- `Optional Deep Dives`

`Category Results` には、少なくとも `Category / Stage / Verdict / Evidence / Risk / Next Action` を含める。
根拠が弱い場合は、断定せず `不足している証拠` を書く。

## 完了条件

- プロジェクトプロファイルが埋まっている
- Hard Gate がすべて `Pass / Warning / Blocker / N/A` に分類されている
- 現在段階の Stage Gate が判定されている
- Blocker と Warning に、次に取るべき最小アクションが付いている
- 総合判定が 4 段階のどれかに落ちている

## 参照ファイル

- プロジェクトプロファイル: `references/project-profile.md`
- 常時必須 gate: `references/hard-gates.md`
- 段階別 gate: `references/stage-gates.md`
- 付録索引の coverage map: `references/appendix-index-map.md`
- 深掘り質問索引: `references/deep-dive-index.md`
- 出力テンプレート: `references/report-template.md`
