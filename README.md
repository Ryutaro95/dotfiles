# dotfiles

Linux固有の設定は `linux/config/` で管理します。

- `~/.config/fcitx5` → `linux/config/fcitx5`
- `~/.config/fish` → `linux/config/fish`

上記のディレクトリはシンボリックリンクで参照します。fcitx5・fishの設定変更はdotfilesにも反映されます。
COSMICの設定は `~/.config/cosmic` に保存し、Git管理しません。
fcitx5が生成する `conf/cached_layouts` はGit管理から除外しています。
fish内の `.claude/` はローカルのツール設定としてGit管理から除外しています。
`config/fish/` は既存の共通・macOS向け設定として残しています。

## zsh

zshの設定はこのリポジトリで管理します。リンク先を編集しても変更はこのリポジトリに反映されます。

| 利用するパス | 管理するファイル | 用途 |
| --- | --- | --- |
| `~/.zshenv` | `home/.zshenv` | すべてのzshで共通の環境変数・PATHを読み込む |
| `~/.zprofile` | `home/.zprofile` | ログイン時のHomebrew・環境変数の設定 |
| `~/.zshrc` | `home/.zshrc` | 対話シェルの履歴設定・補完・キーバインド・エイリアス・プラグイン |
| `~/.config/zsh/` | `config/zsh/` | 環境変数・関数などの共通設定 |

- `config/zsh/env.zsh`: 環境変数とPATH
- `config/zsh/functions.zsh`: ディレクトリ移動時のフックと関数の読み込み
- `config/zsh/project.zsh`: Gitプロジェクト検索（`cdp`）。詳細は[こちら](config/zsh/README.md)

今後 `.zlogin` や `.zlogout` が必要になった場合も `home/` に追加し、
ホームディレクトリからシンボリックリンクを作成します。
新しいターミナルを開くと設定全体が反映されます。

履歴（`~/.zsh_history`）や補完キャッシュ（`~/.zcompdump*`）などの実行データ、
APIキーなどの秘密情報はリポジトリに追加しません。
