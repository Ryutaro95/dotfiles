local macchiato = require("catppuccin.palettes").get_palette("macchiato")
return {
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        mirage = true,
        overrides = {
          Normal = { bg = "None" },
          ColorColumn = { bg = "None" },
          SignColumn = { bg = "None" },
          Folded = { bg = "None" },
          FoldColumn = { bg = "None" },
          -- CursorLine = { bg = "None" },
          CursorColumn = { bg = "None" },
          WhichKeyFloat = { bg = "None" },
          VertSplit = { bg = "None" },
          LspInlayHint = { fg = "#a0a0a0", bg = "None", italic = true },
          Comment = { fg = "#6272A4", bg = "None", italic = true },
          LineNr = { fg = "#808080", bg = "None" }, -- 行番号
          -- NeoTreeNormal = { fg = "#DED9D9", bg = "#1A1F29" },
          -- NeoTreeNormalNC = { fg = "#DED9D9", bg = "#1A1F29" },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu",
    },
  },
}
