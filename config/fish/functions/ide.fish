function ide
    # 引数があればそのディレクトリ、なければカレント
    set dir "."
    if test (count $argv) -ge 1
        set dir $argv[1]
    end

    # セッション名をディレクトリ名から生成
    set session "ide-"(basename $dir)

    # すでにセッションがあれば attach だけする
    if tmux has-session -t $session 2>/dev/null
        tmux attach-session -t $session
        return
    end

    # 1. 全画面で左上 Vim（Neovim）のペインを作る
    tmux new-session -d -s $session -c $dir nvim # vim 派なら "vim"

    # 2. 左ペインを左右に分割して、右に縦長シェルを作る
    #    -p 30 は「右を 30% 幅」にする。好みで調整可（例: 25, 35 など）。
    tmux split-window -h -c $dir -p 30

    # 3. 左側（Vim のあるペイン）を上下に分割して、下にシェルを作る
    tmux select-pane -t 0
    # -p 30 は「下ペインを 30% 高さ」にする。ここもお好みで。
    tmux split-window -v -c $dir -p 30

    # 4. 最初のフォーカスは左上 Vim にしておく
    tmux select-pane -t 0

    # 5. セッションに attach
    tmux attach-session -t $session
end
