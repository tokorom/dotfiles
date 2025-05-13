#!/bin/zsh

# エラーが発生したら即座に終了
set -e

WORKSPACE_FOLDER="$1"

# 環境変数の読み込み
source "$WORKSPACE_FOLDER/.vscode/.env"

# xclogparserを使用してビルドの問題を収集
xclogparser parse \
  --project "$PROJECT_NAME" \
  --reporter flatJson | \
  jq '[.[].errors[], .[].warnings[]] | flatten | .[]' | \
  jq -r '(if .documentURL == "" then .detail else (.documentURL | gsub("^file://"; "")) + ":" + (.startingLineNumber | tostring) + ":" + (.startingColumnNumber | tostring) + ":" + (if .severity == 0 then " error: " else " warning: " end) + .title end)'