-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt.tabstop = 4 -- タブ幅を4に設定
    vim.opt.shiftwidth = 4 -- インデント幅を4に設定
    vim.opt.expandtab = false -- タブをスペースに変換しない
  end,
})
