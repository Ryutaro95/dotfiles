return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = true,
                parameterNames = false,
                rangeVariableTypes = false,
              },
            },
          },
        },
      },
    },
  },
}
