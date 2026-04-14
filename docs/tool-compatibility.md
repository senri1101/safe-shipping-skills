# Tool Compatibility

このリポジトリは、1 つの canonical skill を Codex、Claude Code、GitHub Copilot に持ち運べるように構成している。

## Codex

正式な skill 本体:
- `skills/<skill-name>/`

推奨導線:
- `$skill-installer install <GitHub directory URL>`

補助導線:
- `scripts/install_skill.sh codex <skill-name>`
- `~/.codex/skills/<skill-name>/` へコピーされる

例:
```text
$skill-installer install https://github.com/senri1101/safe-shipping-skills/tree/main/skills/project-readiness-check
```

## Claude Code

正式な project-level 入口:
- `CLAUDE.md`
- `.claude/commands/<skill-name>.md`

推奨導線:
- この repo をそのまま開く
- Claude Code が project memory と project command を読む

補助導線:
- `scripts/install_skill.sh claude <skill-name>`
- `~/.claude/commands/<skill-name>.md` へコピーされる

例:
```text
/project-readiness-check
```

## GitHub Copilot

正式な repo-level 入口:
- `.github/skills/<skill-name>/SKILL.md`

補助 instruction:
- `.github/copilot-instructions.md`
- `.github/instructions/*.instructions.md`
- `AGENTS.md`

推奨導線:
- この repo をそのまま開く

補助導線:
- `scripts/install_skill.sh copilot <skill-name>`
- `~/.copilot/skills/<skill-name>/` へ canonical skill をコピーする

## 設計原則

- reusable workflow は `skills/` の 1 箇所に集約する
- ツールごとの差分は wrapper に閉じ込める
- wrapper にロジックを複製しない
- できるだけ stable なファイル名とディレクトリ名を使う
