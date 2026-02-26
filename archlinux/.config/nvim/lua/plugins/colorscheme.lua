return {
  {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false, -- 背景色を有効にする
    },
    config = function()
      vim.cmd("colorscheme jb")
    end,
  },
}
