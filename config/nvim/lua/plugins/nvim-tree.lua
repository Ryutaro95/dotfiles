local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "<C-CR>", api.node.open.tab, { buffer = bufnr, noremap = true, silent = true, desc = "Open in new tab" })
end

nvim_tree.setup({
    on_attach = my_on_attach,
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    view = {
        width = 32,
        side = "left",
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
    filters = {
        dotfiles = false,
    },
})

vim.keymap.set("n", "<Leader>E", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file explorer tree" })
vim.keymap.set("n", "<Leader>fe", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file explorer tree" })
