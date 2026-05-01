require('nvim-treesitter').setup({
    highlight = { enable = true },
})
require('nvim-treesitter').install({
    "lua",
    "php",
    "go",
    "gomod",
    "gosum",
    "rust",
    "nix",
})
