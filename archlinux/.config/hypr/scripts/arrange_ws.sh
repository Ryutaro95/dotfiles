#!/usr/bin/env bash
# arrange_ws_fixed.sh — Hyprland ワークスペースを所定のモニタへ並べ替え（ハードコード版）
# 1..7  → DP-1（外部）
# 8..10 → eDP-1（内蔵）

set -u

# 必須コマンド確認
if ! command -v hyprctl >/dev/null 2>&1; then
  echo "ERROR: hyprctl が見つかりません。" >&2
  exit 1
fi

# モニタ名はハードコード
EXT_MON="DP-1"
INT_MON="eDP-1"

# 並べ替え実行（既に所定なら何も起きません）
echo "Arrange workspaces: [1..7] -> $EXT_MON, [8..10] -> $INT_MON"

# 1..7 を DP-1 へ
# shellcheck disable=SC3003
for i in {1..7}; do
  hyprctl dispatch moveworkspacetomonitor "$i" "$EXT_MON" >/dev/null || \
    echo "WARN: WS $i の移動に失敗（既に $EXT_MON ならOK）"
done

# 8..10 を eDP-1 へ
# shellcheck disable=SC3003
for i in {8..10}; do
  hyprctl dispatch moveworkspacetomonitor "$i" "$INT_MON" >/dev/null || \
    echo "WARN: WS $i の移動に失敗（既に $INT_MON ならOK）"
done

echo "Done."
