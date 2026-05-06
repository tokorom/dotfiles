# 概要

- アプリの概要

# 対象プラットフォーム

- iOS/iPadOS 26以降
- macOS 26以降
- visionOS 26以降

# ビルド

- Xcode MCPが利用できるならXcode MCPによるビルドを優先利用して
- ビルドに失敗したらビルドログを要約し、原因候補と修正案を出して
- 必須ではないが可能なかぎりwarningも残さない

## Git

- 変更を加えた場合はタスクの最後に必ずgit addとgit commitを行う
- commitメッセージはconventional commits形式にする

# デザイン・仕様

- デザイン・仕様についての参照が必要な場合 docs/design.md の内容を見て
