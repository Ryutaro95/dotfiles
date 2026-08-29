local keymap = vim.keymap.set
local s = { slient = true }
-- General
vim.g.mapleader = " "
keymap("n", "<space>", "<Nop>")
keymap("i", "jk", "<Esc>")
-- Finder
keymap("n", "<Leader>e", "<CMD>Oil %:p:h<CR>", { desc = "Open parent directory" })
keymap("n", "<Leader>ff", "<CMD>FzfLua files<CR>", { desc = "Find files" })
keymap("n", ";f", "<CMD>FzfLua files<CR>", { desc = "Find files" })
keymap("n", "<Leader><Space>", "<CMD>FzfLua files<CR>", { desc = "Find files" })
keymap("n", "<Leader>fb", "<CMD>FzfLua buffers<CR>", { desc = "Find buffer" })
keymap("n", ";b", "<CMD>FzfLua buffers<CR>", { desc = "Find buffer" })
keymap("n", "<Leader>bl", "<CMD>FzfLua buffers<CR>", { desc = "Find buffer" })
keymap("n", "<Leader>fg", "<CMD>FzfLua live_grep<CR>", { desc = "Live grep" })
keymap("n", ";g", "<CMD>FzfLua live_grep<CR>", { desc = "Live grep" })
keymap("n", "<Leader>fr", "<CMD>FzfLua oldfiles<CR>", { desc = "Recent files" })
keymap("n", "<Leader>fw", "<CMD>FzfLua grep_cword<CR>", { desc = "Grep word under cursor" })
keymap("n", "<Leader>fk", "<CMD>FzfLua keymaps<CR>", { desc = "Find keymaps" })
keymap("n", ";k", "<CMD>FzfLua keymaps<CR>", { desc = "Find keymaps" })
keymap("n", "<Leader>?", "<CMD>FzfLua keymaps<CR>", { desc = "Find keymaps" })
keymap("n", "<Leader>fc", function()
	require("config.theme").select_theme()
end, { desc = "Select color scheme" })
-- LSP
-- Neovim組み込みのデフォルトgr*系マッピング(gra/gri/grn/grr/grt/grx)を削除。
-- 残しておくと自前の "gr" が前方一致で衝突し、押すたびtimeoutlen分(既定1000ms)待たされる。
for _, lhs in ipairs({ "gra", "gri", "grn", "grr", "grt", "grx" }) do
	pcall(vim.keymap.del, "n", lhs)
end

keymap("n", "gd", function()
	local origin_win = vim.api.nvim_get_current_win()
	local symbol = vim.fn.expand("<cword>")
	vim.lsp.buf.definition({
		on_list = function(options)
			if #options.items <= 1 then
				vim.fn.setqflist({}, " ", options)
				vim.api.nvim_win_call(origin_win, function()
					pcall(vim.cmd, "1cc")
				end)
				vim.api.nvim_set_current_win(origin_win)
				return
			end
			require("config.xref").show({
				items = options.items,
				origin_win = origin_win,
				symbol = symbol,
				label = "Go to definition",
			})
		end,
	})
end, { desc = "LSP: Jump to definition of symbol under cursor" })
keymap("n", "gr", function()
	local origin_win = vim.api.nvim_get_current_win()
	local symbol = vim.fn.expand("<cword>")
	vim.lsp.buf.references(nil, {
		on_list = function(options)
			require("config.xref").show({
				items = options.items,
				origin_win = origin_win,
				symbol = symbol,
				label = "Go to xref",
			})
		end,
	})
end, { desc = "LSP: List all references to symbol under cursor" })
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
keymap("n", "<leader>gg", function()
	vim.cmd("tabnew")
	vim.cmd("terminal lazygit")
	vim.cmd("startinsert")
end, { desc = "Open lazygit" })
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
keymap("n", "<Leader>bn", "<CMD>enew<CR>", { desc = "New empty buffer" })

-- Copy Path / Filename
keymap("n", "<Leader>cp", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify("Copied absolute path: " .. path, vim.log.levels.INFO)
end, { desc = "Copy absolute path to clipboard" })

keymap("n", "<Leader>cr", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	vim.notify("Copied relative path: " .. path, vim.log.levels.INFO)
end, { desc = "Copy relative path to clipboard" })

keymap("n", "<Leader>cf", function()
	local filename = vim.fn.expand("%:t")
	vim.fn.setreg("+", filename)
	vim.notify("Copied file name: " .. filename, vim.log.levels.INFO)
end, { desc = "Copy file name to clipboard" })


