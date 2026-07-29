local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true,
            },
        },
    },
})

local keymap = vim.keymap.set

-- Buffer navigation
keymap("n", "H", "<CMD>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
keymap("n", "L", "<CMD>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- Buffer management
keymap("n", "<Leader>bd", "<CMD>bdelete<CR>", { desc = "Delete current buffer" })
keymap("n", "<Leader>bo", "<CMD>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
