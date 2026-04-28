-- Install tree-sitter-cli, pyright, bash-language-server, python-black, shfmt, fzf 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.foldenable = true     -- folds active
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" }, 
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/f4z3r/gruvbox-material.nvim" },
	{ src = "https://codeberg.org/andyg/leap.nvim" },
	{ src = "https://github.com/tpope/vim-sleuth" },
	{ src = "https://github.com/sainnhe/sonokai" },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Press 'jj' in insert mode to escape
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Map Ctrl+c to copy
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Map Ctrl+v to paste
vim.api.nvim_set_keymap('n', '<C-v>', '"+P', { noremap = true, silent = true })

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
vim.keymap.set('n', '<leader>bb', ':buffers<CR>', { noremap = true, silent = true })

-- language servers
vim.lsp.enable({"pyright"})
vim.lsp.enable({"bashls"})
vim.lsp.enable({"clangd"})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'python', 'bash' },
  callback = function() vim.treesitter.start() end,
})

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true, -- disables setting the background color.
    float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
    },
})

vim.opt.termguicolors = true
vim.g.sonokai_transparent_background = 1
vim.g.sonokai_enable_italic = true
vim.g.sonokai_style = 'default'
vim.cmd.colorscheme('sonokai')
-- vim.cmd.colorscheme "catppuccin-nvim"

-- set lualine
require("lualine").setup({
    options = {
        theme = "auto"
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

-- treesitter
require("nvim-treesitter").install({ "python", "bash", "lua" })

-- custom autopairs
require("autopair").setup()

-- conform
require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
 	sh = { "shfmt" },
	c = { "clang-format" },
	javascript = { "prettier" }
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_format = "fallback",
  },
})

-- tiny-inline-diagnostic
require("tiny-inline-diagnostic").setup({
  preset = "simple",
})

-- leap.nvim
require('leap.user').set_backdrop_highlight('Comment')
