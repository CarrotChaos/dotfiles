vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.foldenable = true     -- folds active
vim.opt.foldlevel = 99        -- open all folds by default

-- Press 'jj' in insert mode to escape
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Map Ctrl+c to copy
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Map Ctrl+v to paste
vim.api.nvim_set_keymap('n', '<C-v>', '"+P', { noremap = true, silent = true })

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.pack.add({
	{ src = "https://github.com/binhtddev/dracula.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp" }, 
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" }, 
	{ src = "https://github.com/nvim-telescope/telescope.nvim" }, 
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/m4xshen/autoclose.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

-- language servers
vim.lsp.enable({"pyright"})
vim.lsp.enable({"bashls"})

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

-- telescope setup
require("telescope").setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
  },
})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- treesitter
require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({ "python", "bash" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "bash" },
  callback = function()
    vim.treesitter.start()
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
-- autoclose
require("autoclose").setup()

-- conform
require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
 	sh = { "shfmt" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

-- set the cursor to be line on exit
vim.cmd [[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25-blinkwait700-blinkoff400-blinkon250
augroup END
]]
