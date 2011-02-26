###############################
# .zshrc
# powerd by naoya
###############################

# こいつの前に .zshenv が読み込まれるのでそちらも参照
# export alias等は .zshenv のほうに記載する

####### base ########

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

####### keybinding ########

bindkey -e

####### prompt ########

## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

## 色を使う
setopt prompt_subst

autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

####### option ########

## 補完機能の強化
autoload -U compinit
compinit

## コアダンプサイズを制限
#limit coredumpsize 102400

## ビープを鳴らさない
#setopt nobeep

## 内部コマンド jobs の出力をデフォルトで jobs -l にする
#setopt long_list_jobs

## 補完候補一覧でファイルの種別をマーク表示
setopt list_types

### サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume

# 補完候補を一覧表示
setopt auto_list

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

## cd 時に自動で push
setopt autopushd

## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
#setopt extendmpt_subst

## サスペンド中のプロセスと同じコマンド名を実行した場合ãªを呼び出してから実行する間に一旦編集
setopt auto_menu

## zsh の開始, 終了時刻をヒストリファイルに書き込む
#setopt extended_history

## =command を command のパス名に展開する
setopt equals

## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst

## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify

## ファイル名の展開で辞書順ではなく数値的にソート
#setopt numeric_glob_sort

## 出力時8ビットを通す
setopt print_eight_bit

## ヒストリを共有
setopt share_history

## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

## 補完候補の色づけ
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## ディレクトリ名だけで cd
setopt auto_cd

## カッコの対応などを自動的に補完
setopt auto_param_keys

## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

## スペルチェック
setopt correct

