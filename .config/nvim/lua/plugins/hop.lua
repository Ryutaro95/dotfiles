local status, hop = pcall(require, 'hop')
if (not status) then return end

hop.setup {
	keys = 'etovxqpdygfblzhckisuran'
}

-- Mapping
local directions = require('hop.hint').HintDirection
vim.api.nvim_set_keymap('n', ';w', ':HopWord<cr>', { silent = true })
