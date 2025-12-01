-- init.lua
require('config.options')      -- General options configuration
require('config.keybinds')     -- Keybindings configuration
require('config.lazy')

vim.cmd [[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25-blinkwait700-blinkoff400-blinkon250
augroup END
]]
