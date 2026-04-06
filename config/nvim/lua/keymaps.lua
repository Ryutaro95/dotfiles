local keymap = vim.keymap.set
local s = { slient = true }

vim.g.mapleader = " "
keymap("n", "<space>", "<Nop>")
keymap("i", "jk", "<Esc>")
keymap("n", "<Leader>e", "<CMD>Oil %:p:h<CR>", { desc = "Open parent directory" })
keymap("n", "<Leader>ff", "<CMD>FzfLua files<CR>", { desc = "Find files" })
keymap("n", "<Leader>fg", "<CMD>FzfLua live_grep<CR>", { desc = "Live grep" })
keymap("n", "<Esc><Esc>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight" })
keymap("n", "<Leader>ss", "<CMD>split<CR>", { desc = "Split horizontal" })
keymap("n", "<Leader>sv", "<CMD>vsplit<CR>", { desc = "Split vertical" })
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
keymap("n", "<Leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
keymap("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
