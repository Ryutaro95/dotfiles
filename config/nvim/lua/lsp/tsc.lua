return {
	-- Native TypeScript 7+ provides the LSP directly.
	cmd = function(dispatchers, config)
		local local_tsc = vim.fs.joinpath(config.root_dir or vim.fn.getcwd(), "node_modules", ".bin", "tsc")
		local cmd = vim.fn.executable(local_tsc) == 1 and local_tsc or "tsc"
		return vim.lsp.rpc.start({ cmd, "--lsp", "--stdio" }, dispatchers)
	end,
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	settings = {
		["js/ts"] = {
			inlayHints = {
				parameterNames = { enabled = "all" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
			},
		},
	},
}
