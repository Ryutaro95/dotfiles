set PATH /opt/homebrew/bin $PATH
set -x LANG ja_JP.UTF-8
# Neovim
set -gx PATH $PATH /opt/nvim-linux-x86_64/bin
# Go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
# Rust
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin
# Claude Code
set -gx PATH ~/.npm-global/bin $PATH

abbr -a ll eza -alF --icons

abbr -a cat bat -p
abbr -a dc docker compose
abbr -a cd z
abbr -a lg lazygit
abbr -a ld lazydocker

# Starship - https://starship.rs/ja-JP/guide/
starship init fish | source
# zoxide
zoxide init fish | source