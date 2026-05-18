#!/bin/zsh

github_release() {
    local repo="$1"
    local tag="$2"
    local token="$3"
    local release_note_file="$4"
    local asset_path="$5"
    
    if [[ -z "$repo" || -z "$tag" || -z "$token" || -z "$release_note_file" ]]; then
        echo "Usage: github_release <repo> <tag> <token> <release_note_file> [asset_path]" >&2
        return 1
    fi

    BODY=$(<"$release_note_file" | sed ':a;N;$!ba;s/\n/\\n/g' | sed 's/"/\\"/g')

    local api_url="https://api.github.com/repos/$repo/releases"
    local response=$(curl -s -X POST $api_url \
        -H "Authorization: token $token" \
        -H "Content-Type: application/json" \
        -d "{
            \"tag_name\": \"$tag\",
            \"name\": \"v$tag\",
            \"body\": \"$BODY\",
            \"draft\": false,
            \"prerelease\": false
        }")

    echo "Release creation response: $response"

  sync

    # Upload asset if provided
    if [[ -n "$asset_path" && -f "$asset_path" ]]; then
        local release_id=$(echo $response | grep -oE '"id": [0-9]+' | head -n 1 | awk '{print $2}')
        if [[ -z "$release_id" ]]; then
            echo "Error: Could not extract release ID from response." >&2
            return 1
        fi

        local asset_name=$(basename "$asset_path")
        local upload_url="https://uploads.github.com/repos/$repo/releases/$release_id/assets?name=$asset_name"

        for i in {1..10}; do
            if [[ -f "$asset_path" ]] && dd if="$asset_path" of=/dev/null bs=1m count=1 status=none 2>/dev/null; then
                break
            fi
            echo "Waiting for $asset_path to become readable..."
            sleep 1
        done

        echo "Uploading asset $asset_name to release $release_id..."
        curl -s -X POST "$upload_url" \
            -H "Authorization: token $token" \
            -H "Content-Type: application/octet-stream" \
            --data-binary @"$asset_path"
    fi
}
