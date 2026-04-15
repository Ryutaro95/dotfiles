require("aerial").setup({
    backends = { "treesitter", "lsp", "markdown" },
    float = {
        relative = "editor",
        override = function(conf, source_winid)
            local columns = vim.o.columns
            local lines = vim.o.lines
            conf.width = math.floor(columns * 0.4)
            conf.height = math.floor(lines * 0.6)
            conf.col = math.floor((columns - conf.width) / 2)
            conf.row = math.floor((lines - conf.height) / 2)
            conf.anchor = "NW"
            return conf
        end,
    },
})
