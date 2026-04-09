vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
    "border-fused",
    fzf_colors = true,
    winopts = { 
        backdrop = 85,
    },
    actions = {
        files = {
            ["enter"]  = actions.file_edit_or_qf,
        }
    }
})
