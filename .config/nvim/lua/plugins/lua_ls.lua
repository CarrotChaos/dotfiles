local lspconfig = require("lspconfig")

-- check if lua-language-server exists on your system
local lua_ls_path = vim.fn.executable("lua-language-server") == 1

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = lua_ls_path and {
          mason = false, -- use system lua-language-server if it exists
        } or false, -- disable LSP if not found
    },
  },
}
