###############################
# .zshrc
# powerd by naoya
###############################

# こいつの前に .zshenv が読み込まれるのでそちらも参照
# export alias等は .zshenv のほうに記載する

####### history ########

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

# zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history

# ヒストリを共有
setopt share_history

# 全履歴の一覧を出力する 
function history-all { history -E 1 }

####### keybinding ########

# Vi base 
bindkey -v

bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^F' forward-char
bindkey '^B' backward-char
bindkey '^D' delete-char-or-list
bindkey '^U' kill-whole-line
bindkey '^K' kill-line
bindkey '^R' history-incremental-search-backward
bindkey '^W' backward-kill-word

# C-d でログアウトさせない
setopt IGNOREEOF

####### prompt ########

## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

## 色を使う
setopt prompt_subst

autoload -Uz colors
colors

# PROMPTの表示設定 
PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}%1v%2v [%~]%{${reset_color}%}"

# NORMALモードかINSERTモードかでプロンプトの色を変える 
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd)
    PROMPT="%{${fg[red]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
    ;;
    main|viins)
    PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
    ;;
  esac
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# gitのブランチ名と変更状況をプロンプトに表示する 
autoload -Uz is-at-least
if is-at-least 4.3.10; then
  # バージョン管理システムとの連携を有効にする 
  autoload -Uz vcs_info
  autoload -Uz add-zsh-hook

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"
  zstyle ':vcs_info:git:*' unstagedstr "-"
  zstyle ':vcs_info:git:*' formats '@%b%u%c'
  zstyle ':vcs_info:git:*' actionformats '@%b|%a%u%c'

  # VCSの更新時にPROMPTを自動更新する
  function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    psvar[2]=$(_git_not_pushed)
  }
  function _git_not_pushed() {
    if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
      head="$(git rev-parse HEAD)"
      for x in $(git rev-parse --remotes)
      do
        if [ "$head" = "$x" ]; then
          return 0
        fi
      done
      echo "?"
    fi
    return 0
  }
  add-zsh-hook precmd _update_vcs_info_msg
fi

####### 補完機能 #######

autoload -Uz compinit
compinit -u

####### option ########

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

## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
#setopt extendmpt_subst

## サスペンド中のプロセスと同じコマンド名を実行した場合ãªを呼び出してから実行する間に一旦編集
setopt auto_menu

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

####### peco #######

[[ -e ~/zshfiles/peco.zsh ]] && source ~/zshfiles/peco.zsh

####### keychain ########

if [ -x "`which keychain`" ]; then
  keychain ~/.ssh/id_rsa
  . $HOME/.keychain/$HOST-sh
fi

####### rbenv #########

if [ -x "`which rbenv`" ]; then
  eval "$(rbenv init -)"
fi

####### node.js #######

if [ -x "`which nvm`" ]; then
  export NVM_DIR=~/.nvm
  . $(brew --prefix nvm)/nvm.sh
fi

####### gulp #########
  
if [ -x "`which gulp`" ]; then
  eval "$(gulp --completion=zsh)"
fi

####### swift #########

if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
