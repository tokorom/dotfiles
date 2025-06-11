#!/bin/zsh

set -e

FILE="$1"
EXT="$2"
WORKSPACE_FOLDER="$3"

case "${EXT}" in
    ".swift")
        xcrun swift-format lint "${FILE}"
        ;;
    ".md"|".markdown")
        textlint "${FILE}" | ggrep -P "^ *([0-9]+):([0-9]+) +([a-zA-Z]+) +(.*)$" | sed -E "s|^ *([0-9]+):([0-9]+) +([a-zA-Z]+) +(.*)$|${FILE}:\1:\2: \3: \4|"
        ;;
    *)
        exit 0
        ;;
esac
