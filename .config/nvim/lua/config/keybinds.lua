-- Press 'jj' in insert mode to escape
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Map Ctrl+c to copy
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Map Ctrl+v to paste
vim.api.nvim_set_keymap('n', '<C-v>', '"+P', { noremap = true, silent = true })

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
