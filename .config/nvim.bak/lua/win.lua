-- clipboard
vim.opt.clipboard:append{'unnamedplus'}
vim.g.clipboard = {
  name = 'myClipboard',
  copy = {
    ["+"] = 'win32yank.exe -i --crlf',
    ["*"] = 'win32yank.exe -i --crlf'
  },
  paste = {
    ["+"] = 'win32yank.exe -o --lf',
    ["*"] = 'win32yank.exe -o --lf'
  },
  cache_enabled = true
}

-- Theme
vim.cmd[[colorscheme neosolarized]]
