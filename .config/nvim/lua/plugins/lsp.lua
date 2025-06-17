return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {},
        denols = {
          root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
        },
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              gofumpt = true,
              ["local"] = "",
              completeUnimported = true,
            },
          },
          on_attach = function(client, bufnr)
            -- Format with goimports on save
            if client.name == "gopls" then
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                  local params = vim.lsp.util.make_range_params()
                  params.context = { only = { "source.organizeImports" } }
                  local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 3000)
                  for _, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                      if r.edit then
                        vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
                      end
                    end
                  end
                  vim.lsp.buf.format({ async = false })
                end,
              })
            end
          end,
        },
      },
    },
  },
}
