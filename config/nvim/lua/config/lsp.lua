vim.lsp.config("gopls", require("lsp.gopls"))
vim.lsp.config("lua_ls", require("lsp.lua_ls"))
vim.lsp.config("rust-analyzer", require("lsp.rust_analyzer"))
vim.lsp.config("intelephense", require("lsp.intelephense"))
vim.lsp.config("nixd", require("lsp.nixd"))
vim.lsp.config("ts_ls", require("lsp.ts_ls"))
vim.lsp.config("basedpyright", require("lsp.basedpyright"))
vim.lsp.config("svelte", require("lsp.svelte"))
vim.lsp.config("yamlls", require("lsp.yamlls"))
vim.lsp.config("ruby_lsp", require("lsp.ruby_lsp"))

vim.lsp.enable({
	"gopls",
	"lua_ls",
	"rust-analyzer",
	"intelephense",
	"nixd",
	"ts_ls",
	"basedpyright",
	"svelte",
	"yamlls",
	"ruby_lsp",
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
