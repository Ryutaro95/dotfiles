require("ibl").setup({
    indent = {
        char = "│",
        tab_char = "│",
    },
    scope = { enabled = false },
    exclude = {
        filetypes = {
            "help",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
        },
    },
})
