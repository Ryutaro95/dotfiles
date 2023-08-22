vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("neo-tree").setup {
  enable_git_status = true,
  window = {
    position = 'current',
    auto_expand_width = true, -- fileがwindowの幅を超えた場合にwindowsが拡大
  }
}

-- vim.keymap.set('n', ';b', '<Cmd>NeoTreeRevealToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ';b', '<Cmd>Neotree toggle=true<CR>', {noremap = true, silent = true})

-- # How to operate
-- * New File or Directory: a
-- * Delete: d
-- * Seach: f
