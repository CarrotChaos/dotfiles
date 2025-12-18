-- init.lua
require('config.options')      -- General options configuration
require('config.keybinds')     -- Keybindings configuration


vim.pack.add({
	{ src = "https://github.com/binhtddev/dracula.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

-- set colorscheme
vim.cmd("colorscheme dracula")

-- set lualine
require("lualine").setup({
    options = {
        theme = "dracula"
    }
})

-- set the cursor to be line on exit
vim.cmd [[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25-blinkwait700-blinkoff400-blinkon250
augroup END
]]
