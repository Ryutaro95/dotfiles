## LazyVim

### Keymap

<Leader> = Space

- File system

  - NeoTree
    Toggle: `<Leader> + e`
  - Oil
    Toggle: `;o`
    階層戻る: `-`
    階層進む: `Return`
    ファイルプレビュー: `<C-p>`

- Split window
  縦分割: `sv`
  横分割: `ss`

- Move window
  ← ↓ ↑ →
  ctl + h j k l
  フルスクリーン: `<Leader> + m`

- Add tab

- telescope
  ファイル検索: `;f`
  文字列検索: `;r`
  ファイルブラウザ(float): `sf`

- 現在開いているファイルの相対パスをクリップボードにコピー
  scripts/filepath-copy.lua: `cp`
