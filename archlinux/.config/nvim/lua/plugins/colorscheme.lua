return {
  {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function()
      vim.cmd("colorscheme jb")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment", link = false })
      vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "none", fg = comment_hl.fg, bold = true })
    end,
  },
}
