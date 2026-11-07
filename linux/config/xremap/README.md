# xremap

## 設定変更の反映・再起動

xremapはユーザー用のsystemdサービスで起動している。`sudo` は不要。

```bash
systemctl --user restart xremap.service
```

現在の起動オプションは `--watch=device`（デバイスの監視のみ）なので、
`config.yml` を変更したら上のコマンドで再起動する。

サービス定義: [xremap.service](../systemd/user/xremap.service)

## 動作状態の確認

```bash
systemctl --user status xremap.service
```

## ログの確認

直近50件を表示する。

```bash
journalctl --user -u xremap.service -n 50 --no-pager
```

ログをリアルタイムで追う（`Ctrl-C` で表示を終了）。

```bash
journalctl --user -u xremap.service -f
```

## 停止・起動

```bash
systemctl --user stop xremap.service
systemctl --user start xremap.service
```
