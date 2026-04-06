vim.pack.add({
    "https://github.com/folke/which-key.nvim",
})

require("which-key").setup({ preset = "helix" })

require("which-key").add({
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },
    { "<leader>e", desc = "Open parent directory" },
    { "<leader>f", group = "Find" },
    { "<leader>r", group = "Refactor" },
    { "<leader>c", group = "Code" },
    { "<leader>s", group = "Split" },
})
