if status is-interactive
    # Commands to run in interactive sessions can go here
end
set PATH /opt/homebrew/bin $PATH

# Go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

abbr -a vim nvim
abbr -a ll exa -la --icons
abbr -a cat bat -p
abbr -a tree exa -la --icons -T

# rbenv
status --is-interactive; and rbenv init - fish | source
