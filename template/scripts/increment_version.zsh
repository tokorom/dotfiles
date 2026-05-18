#!/bin/zsh

get_sample() {
  echo HELLO
}

# MARKETING_VERSIONを取得する
get_marketing_version() {
    local xcconfig_file="$1"
    local key_name="${2:-MARKETING_VERSION}"

    echo $(grep -Eo "$key_name = [0-9]+\.[0-9]+\.[0-9]+" "$xcconfig_file" | awk '{print $3}')
}

# MARKETING_VERSIONをインクリメントする
increment_marketing_version() {
    local xcconfig_file="$1"
    local key_name="${2:-MARKETING_VERSION}"
    local increment_part="${3:-patch}"

    # xcconfigファイルが存在するか確認
    if [[ ! -f "$xcconfig_file" ]]; then
        echo "Error: $xcconfig_file not found."
        return 1
    fi

    # 現在のバージョンを取得
    local current_version=$(get_marketing_version $xcconfig_file $key_name)

    # バージョンを分割
    IFS='.' read -r major minor patch <<< "$current_version"

    # 指定された部分をインクリメント
    case "$increment_part" in
        major)
            major=$((major + 1))
            minor=0
            patch=0
            ;;
        minor)
            minor=$((minor + 1))
            patch=0
            ;;
        patch)
            patch=$((patch + 1))
            ;;
        *)
            echo "Error: Invalid increment part specified. Use 'major', 'minor', or 'patch'."
            return 1
            ;;
    esac

    # 新しいバージョンを作成
    local new_version="$major.$minor.$patch"

    # xcconfigファイル内のバージョンを新しいバージョンに置換
    sed -i "s/$key_name = $current_version/$key_name = $new_version/" "$xcconfig_file"

    echo "Updated $key_name from $current_version to $new_version in $xcconfig_file"
}

# CURRENT_PROJECT_VERSIONを取得する
get_build_number() {
    local xcconfig_file="$1"
    local key_name="${2:-CURRENT_PROJECT_VERSION}"

    echo $(grep -Eo "$key_name = [0-9]+" "$xcconfig_file" | awk '{print $3}')
}

# CURRENT_PROJECT_VERSIONをインクリメントする
increment_build_number() {
    local xcconfig_file="$1"
    local key_name="${2:-CURRENT_PROJECT_VERSION}"

    # xcconfigファイルが存在するか確認
    if [[ ! -f "$xcconfig_file" ]]; then
        echo "Error: $xcconfig_file not found."
        return 1
    fi

    # 現在のビルドナンバーを取得
    local current_build_number=$(get_build_number $xcconfig_file $key_name)

    # 新しいビルドナンバーを作成
    local new_build_number="$((current_build_number + 1))"

    # xcconfigファイル内のビルドナンバーを新しいビルドナンバーに置換
    sed -i "s/$key_name = $current_build_number/$key_name = $new_build_number/" "$xcconfig_file"

    echo "Updated $key_name from $current_build_number to $new_build_number in $xcconfig_file"
}
