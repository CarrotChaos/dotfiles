require('config.options')      -- General options configuration
require('config.keybinds')     -- Keybindings configuration

vim.pack.add({
	{ src = "https://github.com/binhtddev/dracula.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp" }, 
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" }, 
})

-- set colorscheme
vim.cmd("colorscheme dracula")

-- set lualine
require("lualine").setup({
    options = {
        theme = "dracula"
    }
})

-- setup blink.cmp
require("blink.cmp").setup({
  fuzzy = {
    implementation = "lua",
  },
})

-- highlight colors
require('nvim-highlight-colors').setup({})

-- language servers
vim.lsp.enable({"pyright"})
vim.lsp.enable({"bashls"})

-- set the cursor to be line on exit
vim.cmd [[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25-blinkwait700-blinkoff400-blinkon250
augroup END
]]
