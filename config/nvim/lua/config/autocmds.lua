-- treesitterハイライト有効化
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "php", "go", "gomod", "gosum", "rust" },
    callback = function()
        vim.treesitter.start()
    end,
})

-- 保存時に自動format
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
        })
        vim.lsp.buf.format({ async = false })
    end,
})
