-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local Util = require("lazyvim.util")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<C-.>", ":tabnext<Return>", opts)
keymap.set("n", "<C-,>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Oil.nvim File system
keymap.set("n", ";o", ":Oil<Return>", { desc = "Open parent directory" })

-- Terminal Mappings
-- local lazyterm = function()
--   Util.terminal(nil, { cmd = Util.root() })
-- end
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
keymap.set("n", ";t", lazyterm, { desc = "Terminal (root dir)" })
keymap.set("n", "<C-/>", lazyterm, { desc = "Terminal (root dir)" })

-- Show diagnostic message
keymap.set("n", ";d", vim.diagnostic.open_float, opts)
