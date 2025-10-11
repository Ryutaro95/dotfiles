# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

alias ll='eza -alF --icons'
alias tree='eza -alF --icons -T'
alias v='nvim'
alias vim='nvim'
alias lg='lazygit'

export PATH="$HOME/.cargo/bin:$PATH"
