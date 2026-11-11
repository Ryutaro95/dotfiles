require("noice").setup({
    cmdline = {
        view = "cmdline_popup",
    },
    views = {
        cmdline_popup = {
            position = { row = 3, col = "50%" },
            border = { style = "rounded" },
        },
    },
    presets = {
        bottom_search = true,
    },
    messages = { enabled = false },
    notify = { enabled = false },
    lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
        message = { enabled = false },
    },
})
