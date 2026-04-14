# safe-shipping-skills

AI を使って作ったコードや設計を、安全にリリースするための review-first な skill 集です。

伊勢川暁さんの Qiita 記事で示されている「最低限守るべき作法」に強く影響を受け、セキュリティ、法務、コスト、データ設計、テスト、運用準備といった観点を、AI ワークフローとして再利用しやすい形に整理しています。

## Inspiration / 着想元

- [エンジニア歴20年の私が、素人バイブコーディング勢に物申す](https://qiita.com/Akira-Isegawa/items/00f23d206c504db2ac3b)

このリポジトリは、上記の記事の問題意識に着想を得ています。ただし、記事本文をそのまま再配布するものではありません。記事で示された観点をもとに、skill / workflow / template として再構成したオリジナルの運用資産として管理しています。

## このリポジトリの目的

- 社内メンバーが GitHub 経由で同じ skill を利用できるようにする
- 幅広いベストプラクティスを、実行可能な review workflow に落とし込む
- Codex、Claude Code、GitHub Copilot の 3 つで再利用できる構成を保つ

## 対応ツール

- Codex
- Claude Code
- GitHub Copilot

共通の本体は `skills/` に置き、ツールごとの正式な入口だけを薄い wrapper として用意しています。

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
- このリポジトリをそのまま開く
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
- このリポジトリをそのまま開く
- `.github/skills/project-readiness-check/SKILL.md` を repo-level agent skill として使う
- `.github/copilot-instructions.md` と `.github/instructions/skills.instructions.md` を補助情報として使う

補助方法:
```bash
bash scripts/install_skill.sh copilot project-readiness-check
```

インストール先:
- `~/.copilot/skills/project-readiness-check`

## 社内向けの導入手順

1. このリポジトリを clone する
2. 使いたい skill を決める
3. 利用するツールに応じて、推奨方法または `scripts/install_skill.sh` を使って導入する
4. 変更を加える場合は `skills/` を共通の本体として更新する
5. ツール固有の入口は wrapper 側だけを最小限修正して追従する

## 同梱している skill

### `project-readiness-check`

企画前から運用中までを対象に、以下の観点を `Pass / Warning / Blocker / N/A` で点検する skill です。

- セキュリティの基本要件
- シークレット管理
- 認可とテナント分離
- 法務・プライバシー・ライセンスのリスク
- コストの暴走対策
- データ設計とトランザクション設計
- テスト戦略
- リリース準備と運用体制

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

## skill を追加する人へ

追加ルールとテンプレートは以下にまとめています。

- 追加ルール: `docs/adding-skills.md`
- ツール互換ガイド: `docs/tool-compatibility.md`
- skill 雛形: `templates/skill-template/`

## 権利とライセンスに関するメモ

- このリポジトリは Qiita 記事に着想を得ていますが、記事本文や画像を再ライセンスするものではありません
- Qiita 上の投稿内容の権利は投稿者側に留保される前提で扱い、必要な参照は原文 URL へのリンクで行います
- このリポジトリで配布する skill / workflow / template は、記事の論点をもとに再構成したオリジナル内容です
- 外部記事に着想を得て skill を追加する場合も、原文転載ではなく、出典リンクと再構成を基本にしてください
- 詳細は `NOTICE.md` を参照してください

## 今後追加したいもの

- `design-readiness-check`
- `code-change-check`
- `release-readiness-check`
