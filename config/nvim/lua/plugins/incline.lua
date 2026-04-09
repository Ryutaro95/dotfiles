local colors = require("tokyonight.colors").setup()
require("incline").setup({
    highlight = {
        groups = {
            InclineNormal = { guibg = "#FFAA00", guifg = colors.black },
            InclineNormalNC = { guifg = "#FFAA00", guibg = colors.black },
        },
    },
    window = { margin = { vertical = 0, horizontal = 1 } },
    hide = {
        cursorline = true,
    },
    render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
        end

        return { { icon, guifg = color }, { " " }, { filename } }
    end,
})
