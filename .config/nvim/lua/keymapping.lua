local option = { noremap = true }

vim.api.nvim_set_keymap('n', '<C-s>', '<Cmd>:w<cr>', option)
vim.api.nvim_set_keymap('n', '<esc><esc>', ':noh<cr>', option)

-- New tab
vim.api.nvim_set_keymap('n', 'te', ':tabedit', option)
-- Split window
vim.api.nvim_set_keymap('n', 'ss', ':split<Return><C-w>w', option)
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return><C-w>w', option)
-- Move window
vim.api.nvim_set_keymap('n', '<Space>', '<C-w>w', option)
vim.api.nvim_set_keymap('', 'sh', '<C-w>h', option)
vim.api.nvim_set_keymap('', 'sk', '<C-w>k', option)
vim.api.nvim_set_keymap('', 'sj', '<C-w>j', option)
vim.api.nvim_set_keymap('', 'sl', '<C-w>l', option)
-- Resize window
vim.api.nvim_set_keymap('n', '<C-w><left>', '<C-w><', option)
vim.api.nvim_set_keymap('n', '<C-w><right>', '<C-w>>', option)
vim.api.nvim_set_keymap('n', '<C-w><up>', '<C-w>+', option)
vim.api.nvim_set_keymap('n', '<C-w><down>', '<C-w>-', option)
