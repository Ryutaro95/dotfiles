local mc = require("multicursor-nvim")
mc.setup()

local set = vim.keymap.set

set({ "n", "x" }, "<C-S-Up>", function()
    mc.lineAddCursor(-1)
end, { desc = "Add cursor above" })
set({ "n", "x" }, "<C-S-Down>", function()
    mc.lineAddCursor(1)
end, { desc = "Add cursor below" })
set({ "n", "x" }, "<C-S-Left>", function()
    mc.matchAddCursor(-1)
end, { desc = "Add cursor at previous word/selection match" })
set({ "n", "x" }, "<C-S-Right>", function()
    mc.matchAddCursor(1)
end, { desc = "Add cursor at next word/selection match" })

mc.addKeymapLayer(function(layerSet)
    layerSet("n", "<Esc>", mc.clearCursors, { desc = "Clear extra cursors" })
    layerSet("n", "<C-c>", mc.clearCursors, { desc = "Clear extra cursors" })
end)
