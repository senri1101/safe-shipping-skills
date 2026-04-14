# Report Template

以下のフォーマットで結果を返す。カテゴリ名や順序は調整してよいが、節の欠落は不可。

```md
# Project Readiness Report

## Project Profile

| Item | Value | Evidence / Notes |
| --- | --- | --- |
| Project Type |  |  |
| Exposure |  |  |
| Data Class |  |  |
| Auth / Authz / Multi-tenant |  |  |
| Variable-cost Services |  |  |
| Runtime Base |  |  |
| AI / LLM Usage |  |  |
| Current Stage |  |  |

## Overall Verdict

- Verdict: `Prototype Only / Internal Limited Use / Release Candidate With Fixes / Release Ready`
- Summary: 2-4 行で全体像
- Rationale:
  - 主要 Blocker
  - 公開可否
  - 次の判断ポイント

## Blockers

| Category | Why Blocked | Evidence | Minimum Fix |
| --- | --- | --- | --- |
|  |  |  |  |

## Warnings

| Category | Risk | Evidence | Follow-up |
| --- | --- | --- | --- |
|  |  |  |  |

## Category Results

| Category | Stage | Verdict | Evidence | Risk | Next Action |
| --- | --- | --- | --- | --- | --- |
| H2 Secrets Management | Hard Gate | Pass / Warning / Blocker / N/A |  |  |  |
| H3 Authorization And Tenant Isolation | Hard Gate |  |  |  |  |
| 2. Design / Transactions | Stage Gate |  |  |  |  |

## Required Next Actions

1. 3 件以内の最優先アクションを書く
2. 「誰が」「何を」「どこまでやれば次の判定へ進めるか」を書く
3. 期限や前提条件があれば書く

## Optional Deep Dives

- `B-3 整合性・トランザクション`: 途中失敗、再送、冪等性を追加確認
- `E-3 LLMセキュリティ`: プロンプトインジェクション、保持、権限境界を追加確認
- `L-11 依存関係`: 脆弱性、EOL、ライセンス互換性を追加確認
```

## Verdict の使い分け

### Prototype Only
- 使い捨て前提でのみ許容
- 外部共有や継続運用はまだ不可
- Hard Gate の Blocker が残っていることが多い

### Internal Limited Use
- 社内や限定利用なら条件付きで検討可能
- 外部公開には不足がある
- 監視、認可、法務、コストのいずれかが未完成

### Release Candidate With Fixes
- 致命的な Hard Gate の欠落はない
- 残課題は明確で、是正後に公開判断できる
- リリース前の最終修正待ち

### Release Ready
- Blocker なし
- 根拠があり、運用と切り戻しまで説明できる
- 残 Warning は受容済みか、公開判断を妨げない

## 記述ルール

- 根拠のない断定を避ける
- `Unknown` のままにせず、足りない証拠を明記する
- `N/A` は不要理由を 1 行添える
- Blocker には必ず最小修正案を付ける
