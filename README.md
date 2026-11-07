# dotfiles

Linux固有の設定は `linux/config/` で管理します。

- `~/.config/fcitx5` → `linux/config/fcitx5`
- `~/.config/fish` → `linux/config/fish`

上記のディレクトリはシンボリックリンクで参照します。fcitx5・fishの設定変更はdotfilesにも反映されます。
COSMICの設定は `~/.config/cosmic` に保存し、Git管理しません。
fcitx5が生成する `conf/cached_layouts` はGit管理から除外しています。
fish内の `.claude/` はローカルのツール設定としてGit管理から除外しています。
`config/fish/` は既存の共通・macOS向け設定として残しています。

