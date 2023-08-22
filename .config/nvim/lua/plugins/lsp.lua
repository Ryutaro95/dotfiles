-- Mason
local status, mason = pcall(require, 'mason')
if (not status) then return end
local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not status2) then return end
local status3, lspconfig = pcall(require, 'nvim-lspconfig')
local status4, mason_null_ls = pcall(require, 'mason-null-ls')


-- Mapping
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Hide text messages
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

mason.setup {}
mason_null_ls.setup { automatic_setup = true }
mason_lspconfig.setup {
	ensure_installed = { 'lua_ls', 'gopls', 'rust_analyzer' }
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup { on_attach = on_attach }
	end
}

function go_org_imports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { 'source.organizeImports' }}
	local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, wait_ms)
	for cid, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
				vim.lsp.util.apply_workspace_edit(r.edit, enc)
			end
		end
	end
end

vim.cmd('autocmd BufWritePre *.go lua go_org_imports()')
