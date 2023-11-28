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

-- Indentation per language
local my_filetype = require('myfiletype')
-- Text wrap per file type
local wrap_filetype = require('switch_wrap')

vim.api.nvim_create_augroup('vimrc_augroup', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'vimrc_augroup',
  pattern = '*',
  callback = function(args) my_filetype[args.match]() end
})
vim.api.nvim_create_autocmd('FileType', {
  group = 'vimrc_augroup',
  pattern = '*',
  callback = function(args) wrap_filetype[args.match]() end
})

local has = vim.fn.has
local is_mac = has "macunix"
if is_mac then
    require('macos')
else
    require('win')
end

if vim.g.neovide then
	vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
	vim.keymap.set('v', '<D-c>', '"+y') -- Copy
	vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
	vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
	vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
	vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end
-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
