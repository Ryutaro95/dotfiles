require("mini.pairs").setup({})

-- Delete the generated pair as well.
vim.keymap.set("i", "<C-h>", "v:lua.MiniPairs.bs()", {
    expr = true,
    replace_keycodes = false,
})
