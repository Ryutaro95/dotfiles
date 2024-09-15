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
          CursorLine = { bg = "None" },
          CursorColumn = { bg = "None" },
          WhichKeyFloat = { bg = "None" },
          VertSplit = { bg = "None" },
          LspInlayHint = { fg = "#a0a0a0", bg = "None", italic = true },
          Comment = { fg = "#6272A4", bg = "None", italic = true },
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
