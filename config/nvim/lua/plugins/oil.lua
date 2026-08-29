require("mini.icons").setup()

require("oil").setup({
    columns = {
        "icon",
    },
    win_options = {
        signcolumn = "yes:2",
        winhighlight = "Normal:QfNormal,NormalNC:QfNormal,SignColumn:QfNormal,EndOfBuffer:QfNormal",
    },
    keymaps = {
        ["q"] = "actions.close",
        ["<Esc>"] = "actions.close",
        ["<C-CR>"] = "actions.select_tab",
    },
    view_options = {
        show_hidden = true,
    },
})

require("oil-git-status").setup()
