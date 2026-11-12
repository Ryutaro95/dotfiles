export GOPATH="$HOME/go"
export BUN_INSTALL="$HOME/.bun"

typeset -U path PATH
path=(
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$BUN_INSTALL/bin"
    /opt/homebrew/bin
    /opt/homebrew/sbin
    $path
    "$GOPATH/bin"
)
export PATH
