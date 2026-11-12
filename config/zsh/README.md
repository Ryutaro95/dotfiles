# Gitプロジェクト検索

`cd-project`（エイリアス: `cdp`）で `~/workdir` と `~/work` 配下のGitプロジェクトを検索し、選択したディレクトリへ移動します。
左側がfzfの絞り込み一覧、右側が選択中のプロジェクトのツリー（デフォルト2階層）です。
一覧には `workdir/projects/example` のようにホームからのパスを表示するため、同名のプロジェクトも区別できます。

```zsh
cd-project                # 正式なコマンド名
cdp                       # 検索して移動
cdp nvim                  # 移動後に nvim .
cdp code                  # 移動後に code .
cdp code --reuse-window    # エディタに追加の引数を渡す
cdp --help
```

文字入力で絞り込み、上下キー / Ctrl-N / Ctrl-Pで選択、Enterで決定します。
Esc / Ctrl-Cでキャンセルすると現在のディレクトリは変わりません。
Ctrl-/でプレビューを切り替えられます。エディタ起動時も現在のシェルが選択したディレクトリへ移動します。
検索欄ではCtrl-Kでカーソル位置から末尾まで削除できます。
エディタは実行ファイル名（またはパス）と引数を分けて渡してください。
GUIエディタのCLI（例：`code`）は事前にPATHに追加してください。

検索欄では、fzf標準の `!` でパスに含まれる文字列を除外できます。

```text
!sandbox             sandbox を含むパスを除外
zig !sandbox         zig で絞り込みつつ sandbox を除外
!sandbox !sample     sandbox と sample の両方を除外
```

収集済みの候補一覧に対して絞り込むため、追加のファイル探索は発生しません。

## 除外と設定

`archive`、`archives`、`archived`、`.archive`、`.archives`、`アーカイブ`という名前のディレクトリは、
階層や英字の大文字・小文字を問わず検索対象から除外します。
通常のGitリポジトリに加え、Git worktreeやsubmoduleの `.git` ファイルにも対応します。
Gitプロジェクトを見つけた時点で、その内部の探索を止めます。
このため、プロジェクト内の依存パッケージ・ビルド成果物・入れ子のリポジトリは検索しません。
`~/workdir/projects/example` のような整理用ディレクトリの配下は引き続き検索します。
シンボリックリンクのディレクトリは再帰探索しません。

必要に応じて `~/.zshrc` に設定を追加できます。設定を省略するとデフォルトを使います。
配列を指定した場合はデフォルトの配列を置き換えます。

```zsh
PROJECT_DIRS=("$HOME/workdir" "$HOME/work")
PROJECT_EXCLUDE_DIRS=(archive archives archived .archive .archives アーカイブ old backup)
PROJECT_PREVIEW_DEPTH=2
```

`PROJECT_EXCLUDE_DIRS=()` でアーカイブ除外を無効にできます。
除外名には `archive-*` のようなglobパターンも指定できます（クォートして記述）。
プレビューでは `.git`、`node_modules`、`.venv`、`__pycache__`、`.zig-cache`、`zig-cache` を省略します。

## 読み込み

`~/.zshrc` で読み込んでいる `functions.zsh` から `project.zsh` を読み込みます。
追加直後、既存のターミナルでは次を実行すると使えます。

```zsh
source ~/.config/zsh/functions.zsh
```

依存コマンドは `fzf`、`git`、`eza`（または `tree`）です。
