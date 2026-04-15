return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", ".git" },
	settings = {
		["rust-analyzer"] = {
			check = { command = "clippy" },
			inlayHints = {
				enable = true,
				typeHints = { enable = true },
				chainingHints = { enable = true },
				parameterHints = { enable = false },
			},
		},
	},
}
