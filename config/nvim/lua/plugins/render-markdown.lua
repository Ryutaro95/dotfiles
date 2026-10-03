local keymap = vim.keymap.set

require("render-markdown").setup({
    -- 起動時はプレビューoff。<Leader>mp で切り替える
    enabled = false,
})

-- Toggle Markdown rendering in the current buffer using <Leader>mp
keymap("n", "<Leader>mp", "<CMD>RenderMarkdown toggle<CR>", { desc = "Toggle Markdown preview" })
