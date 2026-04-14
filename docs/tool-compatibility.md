# Tool Compatibility

このリポジトリは、1 つの共通 skill を Codex、Claude Code、GitHub Copilot の 3 つで使い回せるように構成しています。

## Codex

正式な skill 本体:
- `skills/<skill-name>/`

推奨する導入方法:
- `$skill-installer install <GitHub directory URL>`

補助的な導入方法:
- `scripts/install_skill.sh codex <skill-name>`
- `~/.codex/skills/<skill-name>/` にコピーされる

例:
```text
$skill-installer install https://github.com/senri1101/safe-shipping-skills/tree/main/skills/project-readiness-check
```

## Claude Code

正式な project-level の入口:
- `CLAUDE.md`
- `.claude/skills/<skill-name>/SKILL.md`
- `.claude/commands/<skill-name>.md`

推奨する導入方法:
- このリポジトリをそのまま開く
- Claude Code が `CLAUDE.md`、`.claude/skills/`、`.claude/commands/` を読む

補助的な導入方法:
- `scripts/install_skill.sh claude <skill-name>`
- `~/.claude/skills/<skill-name>/` と `~/.claude/commands/<skill-name>.md` にコピーされる

例:
```text
/project-readiness-check
```

## GitHub Copilot

正式な repo-level の入口:
- `.github/skills/<skill-name>/SKILL.md`

補助的な instructions:
- `.github/copilot-instructions.md`
- `.github/instructions/*.instructions.md`
- `AGENTS.md`

推奨する導入方法:
- このリポジトリをそのまま開く

補助的な導入方法:
- `scripts/install_skill.sh copilot <skill-name>`
- `~/.copilot/skills/<skill-name>/` に共通 skill をコピーする

## 設計方針

- 再利用する workflow は `skills/` に集約する
- ツールごとの差分は wrapper 側に閉じ込める
- wrapper にロジックを重複させない
- できるだけ安定したファイル名とディレクトリ名を使う
