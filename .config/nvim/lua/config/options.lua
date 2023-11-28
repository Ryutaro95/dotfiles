-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = false -- Absolute line numbers
vim.api.nvim_exec(
  [[
  augroup go_settings
    autocmd!
    autocmd BufRead,BufNewFile *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  augroup END
]],
  false
)
-- local function setup_go()
--   opt.tabstop = 4
--   opt.shiftwidth = 4
-- end
