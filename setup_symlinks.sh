#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1"
  local dst="$2"

  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    echo "  SKIP (exists): $dst"
    return 0
  fi

  ln -s "$src" "$dst"
  echo "  linked: $dst -> $src"
}

echo "=== dotfiles symlink setup ==="
echo ""

# --- home/ 配下をそのまま $HOME/ にリンク ---
echo "[home/ -> ~/]"
while IFS= read -r -d '' src; do
  name="${src#"$DOTFILES/home/"}"
  link "$src" "$HOME/$name"
done < <(find "$DOTFILES/home" -maxdepth 1 -mindepth 1 -print0)
echo ""

# --- config/ 配下をそのまま ~/.config/ にリンク (fish, zed は個別処理) ---
echo "[config/ -> ~/.config/]"
while IFS= read -r -d '' src; do
  name="${src#"$DOTFILES/config/"}"
  case "$name" in
    fish|zed) continue ;;
  esac
  link "$src" "$HOME/.config/$name"
done < <(find "$DOTFILES/config" -maxdepth 1 -mindepth 1 -print0)
echo ""

# --- fish: config.fish のみ ~/.config/fish/ 内にリンク ---
echo "[config/fish/config.fish -> ~/.config/fish/config.fish]"
if [ -d "$HOME/.config/fish" ]; then
  link "$DOTFILES/config/fish/config.fish" "$HOME/.config/fish/config.fish"
else
  echo "  SKIP: ~/.config/fish が存在しません"
fi
echo ""

# --- zed: config/zed/ 配下のファイルを ~/.config/zed/ 内に個別リンク ---
echo "[config/zed/* -> ~/.config/zed/]"
mkdir -p "$HOME/.config/zed"
while IFS= read -r -d '' src; do
  name="${src#"$DOTFILES/config/zed/"}"
  link "$src" "$HOME/.config/zed/$name"
done < <(find "$DOTFILES/config/zed" -maxdepth 1 -mindepth 1 -print0)
echo ""

echo "=== 完了 ==="
