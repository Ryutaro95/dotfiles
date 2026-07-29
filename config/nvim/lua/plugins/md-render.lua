local keymap = vim.keymap.set

-- Toggle Markdown rendering in the current window using <Leader>mp
keymap("n", "<Leader>mp", function()
    require("md-render").preview.toggle()
end, { desc = "Toggle Markdown preview" })

-- Open Markdown preview in a vertical split window (side-by-side) using <Leader>ms
keymap("n", "<Leader>ms", function()
    require("md-render").preview.split({ mods = { vertical = true } })
end, { desc = "Markdown preview (vertical split)" })
