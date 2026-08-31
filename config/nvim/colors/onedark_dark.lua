for k in pairs(package.loaded) do
    if k:match(".*onedark.*") then package.loaded[k] = nil end
end

-- Palette tuned to match Zed editor's built-in "One Dark" theme
-- (assets/themes/one/one.json in zed-industries/zed).
require("onedark").setup({
    style = "dark",
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
require("onedark").colorscheme()
