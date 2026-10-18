require("mini.pairs").setup({})

vim.keymap.set("i", "<CR>", function()
    local cr = vim.keycode("<CR>")
    local keys = MiniPairs.cr()
    if vim.bo.filetype == "zig" and keys ~= cr then
        -- Reindent the moved closing bracket before opening the inner line.
        return cr .. vim.keycode("<C-o>==") .. keys:sub(#cr + 1)
    end
    return keys
end, { expr = true, replace_keycodes = false })

-- Delete the generated pair as well.
vim.keymap.set("i", "<C-h>", "v:lua.MiniPairs.bs()", {
    expr = true,
    replace_keycodes = false,
})
