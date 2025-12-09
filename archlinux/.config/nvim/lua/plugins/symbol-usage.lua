-- return {
--   "Wansmer/symbol-usage.nvim",
--   -- 0.10 以降は LspAttach 推奨なので、0.11 でもこちらに寄せる:contentReference[oaicite:1]{index=1}
--   event = "LspAttach",
--   config = function()
--     local SymbolKind = vim.lsp.protocol.SymbolKind
--
--     require("symbol-usage").setup({
--       -- JetBrains っぽく行の上に出す
--       vt_position = "above",
--
--       -- 関数とメソッド（デフォルト）＋ struct も対象
--       kinds = {
--         SymbolKind.Function,
--         SymbolKind.Method,
--         SymbolKind.Struct,
--       },
--
--       -- 念のためどこかで無効になっていないか確認しやすいようにログオン
--       log = { enabled = true },
--     })
--   end,
-- }
return {
  {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach",
    config = function()
      local SymbolKind = vim.lsp.protocol.SymbolKind
      require("symbol-usage").setup({
        vt_position = "above",
        kinds = {
          SymbolKind.Function,
          SymbolKind.Method,
          SymbolKind.Struct,
        },
      })
    end,
  },
}
