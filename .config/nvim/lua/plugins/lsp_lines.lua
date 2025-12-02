return {
  {
    "whynothugo/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()

      -- Enable lsp_lines automatically
      vim.api.nvim_set_keymap("n", "<Leader>ll", "<cmd>lua require('lsp_lines').toggle()<CR>",
        { noremap = true, silent = true })
    end,
  },
}
