# Show the full destination path after interactive directory changes.
_print_directory_after_chpwd() {
    [[ -o interactive ]] || return 0
    print -r -- "󱞩 $PWD"
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd _print_directory_after_chpwd

source "${${(%):-%N}:A:h}/project.zsh"
