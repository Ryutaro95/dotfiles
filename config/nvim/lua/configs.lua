local opt = vim.opt
opt.termguicolors = true
opt.signcolumn = "yes"
opt.ignorecase = true
opt.swapfile = false
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.number = true
opt.numberwidth = 4
opt.statuscolumn = "%s%l   "
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.inccommand = "nosplit"
opt.undofile = true
opt.clipboard = "unnamedplus"
opt.winborder = "rounded"
opt.updatetime = 500

vim.cmd.filetype("plugin indent on")

vim.g.netrw_liststyle = 1
vim.g.netrw_sort_by = "size"
