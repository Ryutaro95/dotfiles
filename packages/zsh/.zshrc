# rbenv
eval "$(rbenv init -)"

# anyenv
eval "$(anyenv init -)"

# 色を使用できるように設定
autoload -Uz colors
colors

# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で表示された一覧を選択可能にする
zstyle ':completion:*:default' menu select=1

# タブ補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Promptの色設定
# PROMPT="%{${fg[green]}%}➤ryutaro%{${reset_color}%}%{${fg[red]}%}@%{${fg[blue]}%}%m:%{${fg[red]}%} %c %# "

PROMPT='[%F{green}%d%f]'


## Aliasの設定
alias ls='exa'
alias ll='exa -hal --git --time-style=iso --group-directories-first'
alias now='pwd'
alias tree='exa -T'

# Docker
alias dcom='docker-compose'
alias dc='docker'

# Git
alias st='status'

# nvim
alias vim='nvim'

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build: 'zplug --self-manage'
zplug 'mafredri/zsh-async'
# シンタックスハイライトを設定
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# 候補ディレクトリに色を設定する
zplug "liangguohuan/zsh-dircolors-solarized"
zplug "sindresorhus/pure"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if  read -q; then
        echo; zplug install
    fi
fi

zplug load

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# neovimの設定ファイルを
#   ~/dotfiles/.config/nvim/init.vimの設定ファイルを読み込むように設定
# export XDG_CONFIG_HOME=$HOME/dotfiles/.config
# export XDG_CONFIG_HOME=$HOME/.config
export PATH="$HOME/.anyenv/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH=$GOPATH/bin:$PATH
export GOPATH=$HOME/go
export GO111MODULE=on

# Neovim
export XDG_CONFIG_HOME="$HOME/.config"