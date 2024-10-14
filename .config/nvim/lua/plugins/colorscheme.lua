local macchiato = require("catppuccin.palettes").get_palette("macchiato")
return {
  {
    "navarasu/onedark.nvim",
    opts = {
      transparent = true,
    },
  },
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000, -- Ensure it loads first
  --   -- opts = {
  --   --   transparency = true,
  --   -- },
  --   config = function()
  --     require("onedarkpro").setup({
  --       options = {
  --         transparency = true,
  --       },
  --     })
  --   end,
  -- },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     flavour = "macchiato",
  --     color_overrides = {
  --       LspInlayHint = { bg = macchiato.none },
  --     },
  --   },
  --   -- require("catppuccin").setup({
  --   --   flavour = "latte", -- latte, frappe, macchiato, mocha
  --   -- }),
  -- },

  -- {
  --   "Shatur/neovim-ayu",
  --   config = function()
  --     require("ayu").setup({
  --       mirage = true,
  --       overrides = {
  --         Normal = { bg = "None" },
  --         ColorColumn = { bg = "None" },
  --         SignColumn = { bg = "None" },
  --         Folded = { bg = "None" },
  --         FoldColumn = { bg = "None" },
  --         CursorLine = { bg = "None" },
  --         CursorColumn = { bg = "None" },
  --         WhichKeyFloat = { bg = "None" },
  --         VertSplit = { bg = "None" },
  --         LspInlayHint = { fg = "#a0a0a0", bg = "None", italic = true },
  --         Comment = { fg = "#6272A4", bg = "None", italic = true },
  --         LineNr = { fg = "#808080", bg = "None" }, -- 行番号
  --         -- neo-treeの背景色と文字色
  --         NeoTreeNormal = { fg = "#DED9D9", bg = "#1A1F29" },
  --         NeoTreeNormalNC = { fg = "#DED9D9", bg = "#1A1F29" },
  --       },
  --     })
  --   end,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin",
      -- colorscheme = "ayu",
      colorscheme = "onedark",
    },
  },
}
