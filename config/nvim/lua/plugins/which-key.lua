require("which-key").setup({ preset = "helix" })

require("which-key").add({
    { "<leader>?", "<CMD>FzfLua keymaps<CR>", desc = "Find keymaps (FzfLua)" },
    { "<leader>fk", "<CMD>FzfLua keymaps<CR>", desc = "Find keymaps (FzfLua)" },
    { "<leader>e", desc = "Open parent directory" },
    { "<leader>f", group = "Find" },
    { "<leader>r", group = "Refactor" },
    { "<leader>c", group = "Code / Copy" },
    { "<leader>s", group = "Split" },
})
