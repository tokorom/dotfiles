#!/bin/zsh

# エラーが発生したら即座に終了
set -e

WORKSPACE_FOLDER="$1"

cd "$WORKSPACE_FOLDER"
echo "WORKSPACE_FOLDER: $WORKSPACE_FOLDER"

# 環境変数の読み込み
if [ -f ".vscode/.env" ]; then
    source ".vscode/.env"
else
    echo "Warning: .vscode/.env file not found"
fi

# XCODE_TARGET未指定なら*.xcodeprojを探す
if [ -z "$XCODE_TARGET" ]; then
    echo "Warning: XCODE_TARGET is not defined in .vscode/.env"
    XCODE_TARGET=$(find . -maxdepth 1 -type d -name "*.xcodeproj" | head -n 1)
fi

echo "XCODE_TARGET: $XCODE_TARGET"

# 引数の決定
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
