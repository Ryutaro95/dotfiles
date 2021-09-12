# . ~/z/z.sh

if type -q docker-compose
  alias dcm "docker-compose"
  alias dc "docker"
end

if type -q exa
  alias ls "exa -la --icons --git"
  # alias ll "exa -l -g --icons"
  # alias lla "ll -a"
  alias lt "exa -T --icons"
end

# if type -q z
#   alias cd "z"
# end

# nodenv
set -x PATH $HOME/.nodenv/bin $PATH
eval (nodenv init - | source)

# Neovim
set -x XDG_CONFIG_HOME $HOME/.config

# Go
set -x GOPATH $HOME/go
set -x GO111MODULE on
set -x GOBIN $GOPATH/bin
set -x PATH $GOPATH/bin $PATH

# pyenv
set -x PYENV_ROOT %HOME/.pyenv
set -x PATH $PYENV_ROOT/bin:$PATH

set -U FZF_LEGACY_KEYBINDINGS 0

# rust
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin
set -x RUST_BACKTRACE 1

# aleph.js
set -x PATH $HOME/.deno/bin:$PATH
