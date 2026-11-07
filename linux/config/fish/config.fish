source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
export PATH="$HOME/.local/bin:$PATH"

abbr -a zed zeditor
abbr -a lg lazygit
abbr -a ld lazydocker
abbr -a hr herdr

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Emacs
fish_add_path ~/.config/emacs/bin

# mise
mise activate fish | source

# Ruby
if command -q ruby
    set -gx GEM_HOME (ruby -e 'print Gem.user_dir')
    set -gx PATH $GEM_HOME/bin $PATH
end


# Added by Antigravity CLI installer
set -gx PATH "/home/ryutaro9/.local/bin" $PATH
