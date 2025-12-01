return {
  { 
	  "Mofiqul/dracula.nvim", lazy = false, priority = 1000, config = function()
      vim.cmd.colorscheme("dracula")
  end 
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = { theme = 'dracula' }
  }
}

