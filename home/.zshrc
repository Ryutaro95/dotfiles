# PATH
export PATH="/opt/homebrew/bin:$PATH"
export LANG=ja_JP.UTF-8

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Editor aliases
if command -v nvim &>/dev/null; then
    alias vim=nvim
fi

# File listing aliases
if command -v eza &>/dev/null; then
    alias ll='eza -alF --icons'
    alias tree='eza -alF --icons -T'
else
    alias ll='ls -alF'
fi

# Cat alternative
if command -v bat &>/dev/null; then
    alias cat='bat -p'
fi

# Docker aliases
alias dc='docker compose'

# Terminal multiplexer
alias tm=tmux

# Lazygit / Lazydocker
if command -v lazygit &>/dev/null; then
    alias lg=lazygit
fi
if command -v lazydocker &>/dev/null; then
    alias ld=lazydocker
fi

# rbenv
if command -v rbenv &>/dev/null; then
    eval "$(rbenv init - zsh)"
fi

# Starship
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# zoxide
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
    alias cd=z
fi

