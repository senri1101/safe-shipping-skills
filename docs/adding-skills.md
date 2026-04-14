# Adding Skills

このリポジトリでは、`skills/` を canonical source として skill を管理する。

## 基本方針

- skill 名は kebab-case にする
- 再利用ロジックは `skills/<skill-name>/` に集約する
- ツール固有の入口は wrapper として追加し、canonical skill にロジックを重複させない
- `SKILL.md` は短く保ち、長いチェック項目やテンプレートは `references/` に逃がす
- skill ディレクトリの中に README や changelog を作らない

## 必須構成

```text
skills/<skill-name>/
  SKILL.md
  agents/openai.yaml
  references/
```

## `SKILL.md` ルール

- YAML frontmatter に `name` と `description` を必ず入れる
- `description` は「何をする skill か」と「いつ使うか」を明示する
- 本文は workflow と output expectations に集中させる
- 細かい観点集、質問索引、レポート雛形は `references/` に置く

## `agents/openai.yaml` ルール

- `display_name`
- `short_description`
- `default_prompt`
- `policy.allow_implicit_invocation: true`

を基本形とする。

## references の分け方

以下のいずれかに当てはまるものは `references/` に置く。

- 長いチェックリスト
- 質問集
- 出力テンプレート
- ルール集
- 分野別の深掘り資料

## 外部記事や公開資料に着想を得るとき

- README または関連ドキュメントに出典 URL を明記する
- 原文転載ではなく、自分たちの workflow として再構成する
- 明示ライセンスがない限り「元記事と同じライセンス」とは書かない
- 画像、図表、本文の長文引用は持ち込まない
- 権利上の注意が必要な場合は `NOTICE.md` に追記する

## ツール別 wrapper の考え方

### Codex
- `skills/<skill-name>/` をそのまま配布する
- README では GitHub directory URL を使う `$skill-installer` を第一候補にする

### Claude Code
- `CLAUDE.md` を project memory として使う
- 必要なら `.claude/commands/<skill-name>.md` を追加する
- wrapper の中では canonical skill への参照だけを持たせる

### GitHub Copilot
- `.github/skills/<skill-name>/SKILL.md` を repo-level skill として置く
- `.github/copilot-instructions.md`
- `.github/instructions/*.instructions.md`
- `AGENTS.md`

を補助 guidance として使う

## 追加手順

1. `templates/skill-template/` を複製する
2. `<skill-name>` にリネームする
3. `SKILL.md` の frontmatter と本文を埋める
4. `agents/openai.yaml` を skill 内容に合わせて更新する
5. `references/` を必要最低限の粒度で分割する
6. 必要なら `.claude/commands/<skill-name>.md` を追加する
7. 必要なら `.github/skills/<skill-name>/SKILL.md` を追加する
8. README の `同梱 skill` を更新する

## レビュー観点

- skill の発火条件が明確か
- `SKILL.md` が長くなりすぎていないか
- 同じロジックが wrapper 側に重複していないか
- 他のツールへ持ち運べる構造を維持しているか
