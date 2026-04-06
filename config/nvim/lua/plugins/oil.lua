vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/refractalize/oil-git-status.nvim",
    "https://github.com/nvim-mini/mini.icons",
})

require("mini.icons").setup()

require("oil").setup({
    columns = {
        "icon",
    },
    win_options = {
        signcolumn = "yes:2",
    },
    keymaps = {
        ["q"] = "actions.close",
        ["<Esc>"] = "actions.close",
    },
    view_options = {
        show_hidden = true,
    },
})

require("oil-git-status").setup()

