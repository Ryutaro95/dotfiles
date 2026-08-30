require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        jsonc = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        python = { "ruff_format", "ruff_organize_imports" },
        ruby = { "rubocop" },
    },
    formatters = {
        prettierd = {
            condition = function(self, ctx)
                if vim.bo[ctx.buf].filetype == "svelte" then
                    return vim.fs.find({ "node_modules/prettier-plugin-svelte", "node_modules/@sveltejs/prettier-plugin-svelte" }, { path = ctx.filename, upward = true })[1] ~= nil
                end
                return true
            end,
        },
        prettier = {
            condition = function(self, ctx)
                if vim.bo[ctx.buf].filetype == "svelte" then
                    return vim.fs.find({ "node_modules/prettier-plugin-svelte", "node_modules/@sveltejs/prettier-plugin-svelte" }, { path = ctx.filename, upward = true })[1] ~= nil
                end
                return true
            end,
        },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
    },
})
