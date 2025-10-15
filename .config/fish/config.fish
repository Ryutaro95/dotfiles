if status is-interactive
    # Commands to run in interactive sessions can go here
end
set PATH /opt/homebrew/bin $PATH
set -x LANG ja_JP.UTF-8
# Neovim
set -gx PATH $PATH /opt/nvim-linux-x86_64/bin

# Go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Rust
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin

# Deno
set -U fish_user_paths /opt/homebrew/opt/llvm/bin $fish_user_paths

# Claude Code
set -gx PATH ~/.npm-global/bin $PATH

bind \ct ''
bind -M insert \ct ''
bind -M default \ct ''

# Editor aliases
if command -v nvim >/dev/null 2>&1
    abbr -a vim nvim
    abbr -a v nvim
end

# File listing aliases
if command -v eza >/dev/null 2>&1
    abbr -a ll eza -alF --icons
    abbr -a tree eza -alF --icons -T
else
    abbr -a ll ls -alF
    abbr -a tree tree
end

# Cat alternative
if command -v bat >/dev/null 2>&1
    abbr -a cat bat -p
end

# Docker aliases
abbr -a dc docker compose

if command -v lazygit >/dev/null 2>&1
    abbr -a lg lazygit
end

if command -v lazydocker >/dev/null 2>&1
    abbr -a ld lazydocker
end
# Terminal multiplexer
abbr -a tm tmux

# rbenv
if command -v rbenv >/dev/null 2>&1
    status --is-interactive; and rbenv init - fish | source
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryutaro/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/ryutaro/Downloads/google-cloud-sdk/path.fish.inc'
end

# Starship - https://starship.rs/ja-JP/guide/
if command -v starship >/dev/null 2>&1
    starship init fish | source
end

# zoxide
if command -v zoxide >/dev/null 2>&1
    zoxide init fish | source
end

# NVM using bass to run bash nvm in fish
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
function __check_nvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end
