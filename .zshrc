# ---------------------------
# General setting
# ---------------------------
plugins=(git ruby osx bundler brew rails emoji-clock)
export EDITOR=vim           # エディタをVimに設定
export LANG=ja_JP.UTF-8     # 文字コードをUTF-8に設定
export KCODE=u              # KCODEにUTF-8を設定
export AUTOFEATURE=true     # autotestでfeatureを動かす
export ZSH=~/.oh-my-zsh

setopt auto_cd              # コマンド無くてディレクトリ名があればcd
setopt no_beep              # beep音を鳴らさない

#### 補完系 ####
autoload -U compinit; compinit #補完機能を有効にする
setopt auto_list            # 補完候補を一覧表示
setopt auto_menu            # Tab連打で候補を順に表示
setopt list_packed          # 補完候補を詰めて表示
setopt list_types           # 補完候補のファイル種類を表示
setopt CORRECT_ALL          # コマンドを間違えたら訂正
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

#### History ####
HISTFILE=~/.zsh_history     # ヒストリを保存するファイル
HISTSIZE=10000              # メモリに保存されるヒストリの件数
SAVEHIST=10000              # 保存されるヒストリの件数
setopt bang_hist            # !を使ったヒストリ展開を行う
setopt extended_history     # ヒストリに実行時間も保存する
setopt hist_ignore_dups     # 直前と同じコマンドはヒストリに追加しない
setopt share_history        # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks   # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# ---------------------------
# Alias setting
# ---------------------------
#### Aliases ####
case ${OSTYPE} in
    darwin*)
        alias ls="ls -GF"
        ;;
    linux*)
        alias ls="ls -F --color"
        ;;
esac

# Vim関係
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias v=vim
# ls
alias sl=ls
# Python
alias py=python
# Chrome / Chrome Canary
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias selenium="/usr/local/Cellar/selenium-server-standalone/3.4.0/bin/selenium-server"

# cdしたあとに絶対lsする
function cd() {
  builtin cd $@ && ls;
}

# ---------------------------
# Look and feel setting
# ---------------------------
source $ZSH/oh-my-zsh.sh

# 区切り文字を変更
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars "_-./;@"
zstyle ':zle:*' word-style unspecified

#### Ls Color ####
# 色
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx

# 補完時の色
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

# ZLS_COLORS
export ZLS_COLORS=$LS_COLORS
# lsで自動で色をつける
export CLICOLRS=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#### Prompt ####
# プロンプトに色を設定
autoload -U colors; colors
source ~/.zsh_simple_prompt

# ---------------------------
# Other setting
# ---------------------------
# nswitch
alias nswitch="source ~/.switch_proxy.zsh"
nswitch

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init - zsh)"

# pyenv-virtualenv
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# direnv
eval "$(direnv hook zsh)"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# imagemagick
export PATH="${PATH}:/opt/ImageMagick/bin"
export PKG_CONFIG_PATH="/opt/ImageMagick/lib/pkgconfig"

export PATH="/usr/local/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/lib"
export PATH="/usr/local/sbin:$PATH"

# PostgresSQL
export PGDATA=/usr/local/var/postgres

fpath=(/usr/local/share/zsh-completions $fpath)

autoload -U compinit
compinit -u





