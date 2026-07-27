require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        python = { "ruff_format", "ruff_organize_imports" },
    },
    format_on_save = { timeout_ms = 500 },
})
