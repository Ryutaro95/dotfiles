-- 参考: https://vieitesss.github.io/posts/Neovim-new-config/

vim.loader.enable()

require("configs")
require("keymaps")
require("autocmds")
require("statusline")
require("plugins")
require("lsp")
