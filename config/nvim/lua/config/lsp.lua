vim.lsp.config("gopls", require("lsp.gopls"))
vim.lsp.config("lua_ls", require("lsp.lua_ls"))
vim.lsp.config("rust-analyzer", require("lsp.rust_analyzer"))
vim.lsp.config("intelephense", require("lsp.intelephense"))

vim.lsp.enable({
	"gopls",
	"lua_ls",
	"rust-analyzer",
	"intelephense",
})

vim.diagnostic.config({
	virtual_text = false,
	float = {
		border = "rounded",
		source = true,
	},
})

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})
