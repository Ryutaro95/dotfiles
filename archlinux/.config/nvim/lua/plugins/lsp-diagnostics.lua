return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
      float = {
        border = "rounded",
        wrap = true,
        max_width = 80,
        source = true,
      },
    },
  },
}
