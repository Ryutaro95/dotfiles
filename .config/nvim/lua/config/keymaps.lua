-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Note
-- Toggle InlayHint: <leader>uh

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>", { silent = true })

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "<leader>m", function()
  LazyVim.toggle.maximize()
end, { desc = "Toggle Maximize Window" })

local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
keymap.set("n", ";t", lazyterm, { desc = "Terminal (root dir)" })

-- Show diagnostic message float
keymap.set("n", ";d", vim.diagnostic.open_float, opts)

keymap.set("n", "<C-,>", "<Cmd>BufferPrevious<CR>", opts)
keymap.set("n", "<C-.>", "<Cmd>BufferNext<CR>", opts)
keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
keymap.set("n", "<leader>bn", "<Cmd>tabnew<CR>", opts)
keymap.set("n", "<leader>bq", "<Cmd>BufferClose<CR>", opts)
keymap.set("n", "<leader>bQ", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
