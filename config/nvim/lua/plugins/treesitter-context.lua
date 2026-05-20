require('treesitter-context').setup({
    mode = 'cursor',
    max_lines = 3,
})

vim.keymap.set('n', '<leader>ut', function()
    local tsc = require('treesitter-context')
    if tsc.enabled() then
        tsc.disable()
        vim.notify('Treesitter Context disabled', vim.log.levels.INFO)
    else
        tsc.enable()
        vim.notify('Treesitter Context enabled', vim.log.levels.INFO)
    end
end, { desc = 'Toggle Treesitter Context' })
