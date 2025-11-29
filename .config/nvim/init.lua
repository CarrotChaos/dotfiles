-- init.lua

-- Access vim global object
local vim = vim
local Plug = vim.fn['plug#']

-- Plugin section
vim.call('plug#begin')

Plug('Mofiqul/dracula.nvim')

vim.call('plug#end')

vim.cmd('silent! colorscheme dracula')

-- === Keymaps ===
-- Press 'jj' in insert mode to escape
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Map Ctrl+c to copy
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Map Ctrl+v to paste
vim.api.nvim_set_keymap('n', '<C-v>', '"+P', { noremap = true, silent = true })

vim.cmd [[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25-blinkwait700-blinkoff400-blinkon250
augroup END
]]



