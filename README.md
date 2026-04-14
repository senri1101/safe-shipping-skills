# safe-shipping-skills

AI で書いたコードや設計を、安全に出荷するための review-first な skill 集です。

伊勢川暁さんの Qiita 記事にある「最低限守るべき作法」に強くインスパイアされており、セキュリティ、法務、コスト、データ設計、テスト、運用準備を AI ワークフローとして再利用しやすい形にまとめています。

## 目的

- 社内メンバーが GitHub 経由で同じ skill を使えるようにする
- broad なベストプラクティスを、実行可能な review workflow に落とす
- Codex、Claude Code、GitHub Copilot の 3 つで再利用できる形を保つ

## 対応ツール

- Codex
- Claude Code
- GitHub Copilot

canonical source は `skills/` です。ツールごとの正式な入口だけを薄い wrapper として追加しています。

## 導入方法

### Codex

推奨:
```text
$skill-installer install https://github.com/senri1101/safe-shipping-skills/tree/main/skills/project-readiness-check
```

補助方法:
```bash
bash scripts/install_skill.sh codex project-readiness-check
```

インストール先:
- `~/.codex/skills/project-readiness-check`

利用例:
```text
Use $project-readiness-check to assess this repository before release.
```

### Claude Code

推奨:
- この repo をそのまま開く
- `CLAUDE.md` と `.claude/commands/project-readiness-check.md` を使う

補助方法:
```bash
bash scripts/install_skill.sh claude project-readiness-check
```

インストール先:
- `~/.claude/commands/project-readiness-check.md`

利用例:
```text
/project-readiness-check
```

### GitHub Copilot

推奨:
- この repo をそのまま開く
- `.github/skills/project-readiness-check/SKILL.md` を repo-level agent skill として使う
- `.github/copilot-instructions.md` と `.github/instructions/skills.instructions.md` を補助として使う

補助方法:
```bash
bash scripts/install_skill.sh copilot project-readiness-check
```

インストール先:
- `~/.copilot/skills/project-readiness-check`

## 社内向け導入手順

1. この repo を clone する
2. 使いたい skill 名を決める
3. 利用ツールに応じて、推奨導線か `scripts/install_skill.sh` を使う
4. 変更を加える場合は `skills/` を canonical source として更新する
5. ツール固有の入口は wrapper 側だけ最小差分で追従する

## 同梱 skill

### `project-readiness-check`

企画前から運用中までを対象に、以下を `Pass / Warning / Blocker / N/A` で点検する skill です。

- security baseline
- secrets management
- authorization and tenant isolation
- legal, privacy, and license risk
- cost guardrails
- data and transaction design
- test strategy
- release and operational readiness

主な配置:

```text
skills/
  project-readiness-check/
    SKILL.md
    agents/openai.yaml
    references/
.github/skills/
  project-readiness-check/
    SKILL.md
.claude/commands/
  project-readiness-check.md
```

## リポジトリ構成

```text
.
├── skills/
├── scripts/
├── templates/
├── docs/
├── .claude/commands/
├── .github/skills/
├── .github/instructions/
├── CLAUDE.md
└── AGENTS.md
```

## skill を追加する人向け

追加ルールとテンプレートはここにまとめています。

- 追加ルール: `docs/adding-skills.md`
- ツール互換ガイド: `docs/tool-compatibility.md`
- skill 雛形: `templates/skill-template/`

## 今後の拡張候補

- `design-readiness-check`
- `code-change-check`
- `release-readiness-check`
