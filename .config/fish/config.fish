if type -q docker-compose
  alias dcm "docker-compose"
  alias dc "docker"
end

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
  alias tr "exa -T --icons"
end

# nodenv
set -x PATH $HOME/.nodenv/bin $PATH
eval (nodenv init - | source)

# Neovim
set -x XDG_CONFIG_HOME $HOME/.config

# Go
# set -x GOPATH $HOME/go
# set -x GO111MODULE=on

set -U FZF_LEGACY_KEYBINDINGS 0