return {
  -- add dracula
  { "binhtran432k/dracula.nvim" },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    lazy = false,
    priority = 1000,
    opts = {
      colorscheme = "dracula",
    },
  },
}
