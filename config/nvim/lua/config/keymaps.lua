local keymap = vim.keymap.set
local s = { slient = true }
-- General
vim.g.mapleader = " "
keymap("n", "<space>", "<Nop>")
keymap("i", "jk", "<Esc>")
-- Finder
keymap("n", "<Leader>e", "<CMD>Oil %:p:h<CR>", { desc = "Open parent directory" })
keymap("n", "<Leader>ff", "<CMD>FzfLua files<CR>", { desc = "Find files" })
keymap("n", "<Leader>fb", "<CMD>FzfLua buffers<CR>", { desc = "Find buffer" })
keymap("n", "<Leader>fg", "<CMD>FzfLua live_grep<CR>", { desc = "Live grep" })
keymap("n", "<Leader>fr", "<CMD>FzfLua oldfiles<CR>", { desc = "Recent files" })
keymap("n", "<Leader>fw", "<CMD>FzfLua grep_cword<CR>", { desc = "Grep word under cursor" })
-- LSP
keymap("n", "gd", "<CMD>FzfLua lsp_definitions<CR>", { desc = "LSP: Jump to definition of symbol under cursor" })
keymap("n", "gr", "<CMD>FzfLua lsp_references<CR>", { desc = "LSP: List all references to symbol under cursor" })
keymap(
	"n",
	"gi",
	"<CMD>FzfLua lsp_implementations<CR>",
	{ desc = "LSP: Jump to implementation of interface/abstract method" }
)
keymap(
	"n",
	"gt",
	"<CMD>FzfLua lsp_typedefs<CR>",
	{ desc = "LSP: Jump to type definition of variable/argument under cursor" }
)
keymap(
	"n",
	"gD",
	"<CMD>FzfLua lsp_declarations<CR>",
	{ desc = "LSP: Jump to declaration of symbol (may differ from definition)" }
)
-- Editor
keymap("n", "<Esc><Esc>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight" })
keymap("n", "<Leader>ss", "<CMD>split<CR>", { desc = "Split window horizontally" })
keymap("n", "<Leader>sv", "<CMD>vsplit<CR>", { desc = "Split window vertically" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "LSP: Show documentation/type info for symbol under cursor" })
keymap("n", "<Leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename symbol under cursor across the project" })
keymap("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Show code actions (auto-fix, add import, etc.)" })
keymap("n", "<Leader>cs", "<CMD>AerialToggle left<CR>", { desc = "Toggle code symbols outline" })
keymap("n", "<Leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<Leader>u", require("undotree").open, { desc = "Open undo tree" })
