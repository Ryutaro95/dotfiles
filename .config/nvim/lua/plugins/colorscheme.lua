-- local macchiato = require("catppuccin.palettes").get_palette("macchiato")
return {
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.cmd.colorscheme("gruvbox-material")
  --   end,
  -- },

  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        -- transparent = {
        --   bg = true,
        -- },
      })
      require("nordic").load()
    end,
  },

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
  --         -- CursorLine = { bg = "None" },
  --         CursorColumn = { bg = "None" },
  --         WhichKeyFloat = { bg = "None" },
  --         VertSplit = { bg = "None" },
  --         LspInlayHint = { fg = "#a0a0a0", bg = "None", italic = true },
  --         Comment = { fg = "#6272A4", bg = "None", italic = true },
  --         LineNr = { fg = "#808080", bg = "None" }, -- 行番号
  --         -- NeoTreeNormal = { fg = "#DED9D9", bg = "#1A1F29" },
  --         -- NeoTreeNormalNC = { fg = "#DED9D9", bg = "#1A1F29" },
  --       },
  --     })
  --   end,
  -- },

  -- {
  --   "projekt0n/github-nvim-theme",
  --   name = "github-theme",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("github-theme").setup({
  --       options = {
  --
  --         transparent = true,
  --       },
  --     })
  --
  --     -- vim.cmd("colorscheme github_dark")
  --   end,
  -- },

  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     -- colorscheme = "ayu",
  --     colorscheme = "github_dark",
  --   },
  -- },

  -- {
  --   "navarasu/onedark.nvim",
  --   opts = {
  --     style = "cool",
  --     transparent = true,
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
      -- colorscheme = "ayu",
      -- colorscheme = "github_dark",
    },
  },
}
