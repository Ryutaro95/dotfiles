if status is-interactive
    # Commands to run in interactive sessions can go here
end
set PATH /opt/homebrew/bin $PATH
set -x LANG ja_JP.UTF-8

# Go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Rust
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin

# Deno
set -U fish_user_paths /opt/homebrew/opt/llvm/bin $fish_user_paths

abbr -a vim nvim
abbr -a ll eza -alF --icons
abbr -a cat bat -p
abbr -a tree eza -alF --icons -T
abbr -a dc docker compose
abbr -a gui gitui

# rbenv
status --is-interactive; and rbenv init - fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryutaro/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/ryutaro/Downloads/google-cloud-sdk/path.fish.inc'
end

# Starship - https://starship.rs/ja-JP/guide/
starship init fish | source
zoxide init fish | source
