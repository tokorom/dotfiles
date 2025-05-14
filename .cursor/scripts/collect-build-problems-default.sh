#!/bin/zsh

# エラーが発生したら即座に終了
set -e

WORKSPACE_FOLDER="$1"

# 環境変数の読み込み
source "$WORKSPACE_FOLDER/.vscode/.env"

if [ -z "$XCODE_TARGET" ]; then
    echo "Error: XCODE_TARGET is not defined in .vscode/.env"
    exit 1
fi

if [[ "$XCODE_TARGET" == *.xcodeproj ]]; then
    TARGET_FLAG="--xcodeproj"
    TARGET="$WORKSPACE_FOLDER/$XCODE_TARGET"
elif [[ "$XCODE_TARGET" == *.xcworkspace ]]; then
    TARGET_FLAG="--workspace"
    TARGET="$WORKSPACE_FOLDER/$XCODE_TARGET"
else
    TARGET_FLAG="--project"
    TARGET="$XCODE_TARGET"
fi

echo "TARGET: $TARGET_FLAG $TARGET"

# xclogparserを使用してビルドの問題を収集
xclogparser parse \
  $TARGET_FLAG $TARGET \
  --reporter flatJson | \
  jq '[.[].errors[], .[].warnings[]] | flatten | .[]' | \
  jq -r '(if .documentURL == "" then .detail else (.documentURL | gsub("^file://"; "")) + ":" + (.startingLineNumber | tostring) + ":" + (.startingColumnNumber | tostring) + ":" + (if .severity == 2 then " error: " else " warning: " end) + .title end)'
