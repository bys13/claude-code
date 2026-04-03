#!/bin/bash
# CCB (Claude Code Best) 启动脚本
# 使用 MiniMax Anthropic 兼容 API

export PATH="$HOME/.bun/bin:$PATH"
export ANTHROPIC_BASE_URL=https://api.minimaxi.com/anthropic

# 从 .env 读取 key
if [ -f ~/.openclaw/workspace/.env ]; then
  export $(grep MINIMAX_API_KEY ~/.openclaw/workspace/.env | xargs)
fi

export ANTHROPIC_API_KEY="${MINIMAX_API_KEY}"

if [ -z "$ANTHROPIC_API_KEY" ]; then
  echo "❌ 请在 ~/.openclaw/workspace/.env 中设置 MINIMAX_API_KEY"
  exit 1
fi

cd ~/.openclaw/workspace/claude-code-best
bun run dev "$@"
