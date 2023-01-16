-- <Leader> -> " "
vim.g.mapleader = " "

local options = {
	encoding = 'utf-8',
	fileencoding = 'utf-8',
	title = true,
	mouse = 'a',
	number = true,
	cursorline = true,
	termguicolors = true,
	background = 'dark',
	pumblend = 5,
	wrap = false,
	-- Indent
	tabstop = 2,
	shiftwidth = 2,
	autoindent = true,
	expandtab = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

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

-- Indentation per language
local my_filetype = require('myfiletype')
vim.api.nvim_create_augroup('vimrc_augroup', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'vimrc_augroup',
  pattern = '*',
  callback = function(args) my_filetype[args.match]() end
})

-- Theme
vim.cmd[[colorscheme neosolarized]]
