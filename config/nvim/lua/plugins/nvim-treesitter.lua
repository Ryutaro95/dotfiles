vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require('nvim-treesitter').setup({})
require('nvim-treesitter').install({
    "lua",
    "php",
    "go",
    "gomod",
    "gosum",
    "rust",
})
