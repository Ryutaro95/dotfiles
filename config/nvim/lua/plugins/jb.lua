require("jb").setup({ transparent = true })
vim.cmd.colorscheme("jb")
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#6d7682", bg = "NONE" })
