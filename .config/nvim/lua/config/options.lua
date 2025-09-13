vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.relativenumber = false
vim.opt.ignorecase = true
vim.opt.wildignore:append({ "*/node_modules/*", "*/target/*", "*/.git/*" })

-- クリップボード設定
vim.opt.clipboard = "unnamedplus"
