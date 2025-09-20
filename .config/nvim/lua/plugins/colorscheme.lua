-- local macchiato = require("catppuccin.palettes").get_palette("macchiato")
return {
  {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd("colorscheme jb")
    end,
  },
  -- {
  --   "navarasu/onedark.nvim",
  --   opts = {
  --     style = "cool",
  --     transparent = true,
  --   },
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "onedark",
  --   },
  -- },
}
