-- init.lua
require('config.options')      -- General options configuration
require('config.keybinds')     -- Keybindings configuration

vim.pack.add({
	{ src = "https://github.com/Mofiqul/dracula.nvim" },

})

vim.cmd("colorscheme dracula")

vim.cmd [[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25-blinkwait700-blinkoff400-blinkon250
augroup END
]]
