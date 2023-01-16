require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "go", "ruby", "rust" },
  sync_install = true,
  auto_install = true, 

  highlight = {
    enable = true,
  }
}
