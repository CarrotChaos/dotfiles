-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "binhtddev/dracula.nvim",
      config = function()
        vim.cmd("colorscheme dracula")
      end,
    },

    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("lualine").setup({
          options = { theme = "dracula" }
        })
      end
    },

    {
      "Saghen/blink.cmp",
      config = function()
        require("blink.cmp").setup({
          fuzzy = { implementation = "lua" },
          keymap = {
            preset = "enter",
            ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
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
      end
    },

    {
      "brenoprata10/nvim-highlight-colors",
      config = function()
        require("nvim-highlight-colors").setup({})
      end
    },

    {
      "ibhagwan/fzf-lua",
      config = function()
        vim.keymap.set("n", "<leader>ff", function()
          require("fzf-lua").files({ cwd = "/" })
        end, { noremap = true, silent = true })

        require("fzf-lua").setup({
          files = {
            actions = {
              ["default"] = require("fzf-lua").actions.file_edit,
            },
          },
        })
      end
    },

    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
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
      end
    },

    {
      "m4xshen/autoclose.nvim",
      config = function()
        require("autoclose").setup({
          options = { disable_command_mode = true },
        })
      end
    },

    {
      "stevearc/conform.nvim",
      config = function()
        require("conform").setup({
          formatters_by_ft = {
            python = { "black" },
            sh = { "shfmt" },
          },
          format_on_save = {
            timeout_ms = 2000,
            lsp_format = "fallback",
          },
        })
      end
    },

    {
      "romgrk/barbar.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("barbar").setup({ auto_hide = true })
      end
    },

    {
      "rachartier/tiny-inline-diagnostic.nvim",
      config = function()
        require("tiny-inline-diagnostic").setup({ preset = "simple" })
      end
    },

  },

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "dracula" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.foldenable = true
vim.opt.foldlevel = 99

vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<C-v>', '"+P', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
-- Install tree-sitter-cli, pyright, bash-language-server, python-black, shfmt, fzf 

