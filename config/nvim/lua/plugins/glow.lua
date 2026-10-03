local keymap = vim.keymap.set

require("glow").setup({
    -- 文字色は One Light 配色の自作スタイル(glamour形式)を使う
    style = vim.fn.stdpath("config") .. "/glow/onelight.json",
    -- 画面サイズに対する比率で大きさを決める(デフォルトは0.7)
    width_ratio = 0.9,
    height_ratio = 0.9,
    -- 上限で幅が切り詰められると中央からずれるため、上限は実質なしにする
    width = 1000,
    height = 1000,
})

-- プレビューの背景は One Light に固定する(エディタ側のカラースキームに関係なく)
local function set_glow_highlight()
    vim.api.nvim_set_hl(0, "GlowNormal", { bg = "#fafafa", fg = "#383a42" })
end

set_glow_highlight()
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_glow_highlight,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "glowpreview",
    callback = function()
        vim.wo.winhighlight = "Normal:GlowNormal,NormalFloat:GlowNormal"
    end,
})

-- Toggle Markdown preview (floating window) using <Leader>mp
-- プレビューウィンドウ上なら閉じ、それ以外なら開く(q / <Esc> でも閉じられる)
keymap("n", "<Leader>mp", function()
    if vim.bo.filetype == "glowpreview" then
        vim.cmd("Glow!")
    else
        vim.cmd("Glow")
    end
end, { desc = "Toggle Markdown preview" })
