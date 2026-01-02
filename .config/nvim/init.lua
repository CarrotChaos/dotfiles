-- Install tree-sitter-cli, pyright, bash-language-server, python-black, shfmt, fzf 

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
	{ src = "https://github.com/ibhagwan/fzf-lua" }, 
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/m4xshen/autoclose.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/romgrk/barbar.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
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

  keymap = {
    preset = 'enter',
    ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
  },

  completion = {
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
  },
})

-- highlight colors
require('nvim-highlight-colors').setup({})

--fzf-lua
vim.keymap.set('n', '<leader>ff', function()
  require('fzf-lua').files({ cwd = '/'})
end, { noremap = true, silent = true })

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
require("autoclose").setup({
  options = {
    disable_command_mode = true,
  },
})

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

--barbar
require('barbar').setup {
  auto_hide = true,
}

-- set the cursor to be line on exit
vim.cmd [[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25-blinkwait700-blinkoff400-blinkon250
augroup END
]]
