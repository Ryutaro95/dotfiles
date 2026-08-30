-- Palette tuned to match Zed editor's built-in "One Dark" theme
-- (assets/themes/one/one.json in zed-industries/zed). Background is
-- nearly identical to onedark.nvim's default, but Zed's syntax hues
-- are more muted/desaturated, so we override them here.
require("onedark").setup({
    transparent = false,
    colors = {
        bg0 = "#282c33", -- editor.background
        fg = "#acb2be", -- editor.foreground
        grey = "#5d636f", -- comment
        purple = "#b477cf", -- keyword
        green = "#a1c181", -- string
        orange = "#bf956a", -- number / constant
        blue = "#74ade8", -- function / tag
        cyan = "#6eb4bf", -- type / property / operator
        red = "#d07277", -- identifier / variable.parameter
        yellow = "#dfc184", -- constant / constructor
    },
})
