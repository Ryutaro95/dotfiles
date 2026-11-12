# Emit NUL-separated Git project paths, relative to HOME when possible.
_project_candidates() {
    emulate -L zsh

    local -a roots excludes pending projects
    local -A seen
    local root name repo child
    local skip
    if (( ${+PROJECT_DIRS} )); then
        roots=("${PROJECT_DIRS[@]}")
    else
        roots=("$HOME/workdir" "$HOME/work")
    fi
    if (( ${+PROJECT_EXCLUDE_DIRS} )); then
        excludes=("${PROJECT_EXCLUDE_DIRS[@]}")
    else
        excludes=(archive archives archived .archive .archives アーカイブ)
    fi

    for root in "${roots[@]}"; do
        [[ -d "$root" ]] && pending+=("${root:A}")
    done

    while (( ${#pending} )); do
        repo=${pending[-1]}
        pending[-1]=()
        [[ -n "${seen[$repo]-}" ]] && continue
        seen[$repo]=1

        # Exclude archives at any depth, without opening their contents.
        [[ "${repo:t}" == .git ]] && continue
        skip=0
        for name in "${excludes[@]}"; do
            [[ -n "$name" ]] || continue
            if [[ "${repo:t:l}" == ${~name:l} ]]; then
                skip=1
                break
            fi
        done
        (( skip )) && continue

        # Stop at a project root: never scan its dependencies or build output.
        # .git files also cover linked worktrees and submodules.
        if [[ -d "$repo/.git" || -f "$repo/.git" ]] &&
            [[ "$(command git -C "$repo" rev-parse --is-inside-work-tree 2>/dev/null)" == true ]]; then
            projects+=("${repo#$HOME/}")
            continue
        fi

        # Only expand immediate child directories (including hidden ones).
        for child in "$repo"/*(ND/); do
            [[ -L "$child" ]] || pending+=("$child")
        done
    done

    (( ${#projects} )) && print -rN -- "${(@o)projects}"
    return 0
}

# Select a Git project, cd into it, and optionally open an editor.
cd-project() {
    emulate -L zsh

    if [[ "${1-}" == --help || "${1-}" == -h ]]; then
        print -r -- 'Usage: cd-project [EDITOR [EDITOR_OPTIONS...]]
Alias: cdp

  cdp                       Select a project and cd into it
  cdp nvim                  Select, cd, then run nvim .
  cdp code --reuse-window    Select, cd, then run code --reuse-window .

Enter: select   Esc / Ctrl-C: cancel   Ctrl-/: toggle preview

Search examples:
  !sandbox            Exclude paths containing sandbox
  zig !sandbox        Search zig while excluding sandbox

Settings (in ~/.zshrc):
  PROJECT_DIRS=("$HOME/workdir" "$HOME/work")
  PROJECT_EXCLUDE_DIRS=(archive archives archived .archive .archives アーカイブ)
  PROJECT_PREVIEW_DEPTH=2'
        return 0
    fi

    local dependency
    for dependency in fzf git; do
        if (( ! $+commands[$dependency] )); then
            print -u2 -r -- "cd-project: required command not found: $dependency"
            return 127
        fi
    done
    if (( $# )) && ! whence -p -- "$1" >/dev/null; then
        print -u2 -r -- "cd-project: editor not found: $1"
        return 127
    fi

    local depth=${PROJECT_PREVIEW_DEPTH:-2}
    if [[ "$depth" != <-> ]] || (( depth < 1 )); then
        print -u2 -r -- 'cd-project: PROJECT_PREVIEW_DEPTH must be a positive integer'
        return 2
    fi

    local preview='dir={}
[[ "$dir" = /* ]] || dir="$HOME/$dir"
'
    local ignored='.git|node_modules|.venv|__pycache__|.zig-cache|zig-cache'
    if (( $+commands[eza] )); then
        preview+='exec eza --tree --all --color=always --icons=always --level='
        preview+="$depth --ignore-glob=${(q)ignored} -- \"\$dir\""
    elif (( $+commands[tree] )); then
        preview+="exec tree -a -C -L $depth -I ${(q)ignored} -- \"\$dir\""
    else
        print -u2 -r -- 'cd-project: tree preview requires eza or tree (brew install eza)'
        return 127
    fi

    local candidates selected
    candidates="$(_project_candidates)" || return $?
    if [[ -z "$candidates" ]]; then
        print -u2 -r -- 'cd-project: no Git projects found in PROJECT_DIRS (default: ~/workdir, ~/work)'
        return 1
    fi

    selected="$(
        FZF_DEFAULT_OPTS= FZF_DEFAULT_OPTS_FILE= command fzf \
            --read0 --print0 --no-multi --extended --layout=reverse --height=90% --border \
            --prompt='cd-project> ' \
            --header=$'Enter: cd / Esc: cancel / Ctrl-/: preview\n!sandbox: exclude sandbox from results' \
            --preview="$preview" --preview-window='right:60%:border-left' \
            --with-shell='zsh -f -c' --bind='ctrl-/:toggle-preview,ctrl-k:kill-line' \
            < <(print -rn -- "$candidates")
    )" || return $?
    selected=${selected%$'\0'}
    [[ -n "$selected" ]] || return 1
    [[ "$selected" = /* ]] || selected="$HOME/$selected"

    # Bypass aliases such as cd=z so this always changes the current shell.
    builtin cd -- "$selected" || return $?
    if (( $# )); then
        "$@" .
    fi
}

alias cdp='cd-project'
