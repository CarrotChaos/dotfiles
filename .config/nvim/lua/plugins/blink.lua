return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = {
        preset = "enter",

        -- Tab selects first item, then next, etc.
        ["<Tab>"] = {
          "snippet_forward", -- optional: jump inside snippets
          "select_next",
          "fallback",
        },

        -- Shift-Tab reverses
        ["<S-Tab>"] = {
          "snippet_backward",
          "select_prev",
          "fallback",
        },
      }

      opts.completion = {
        list = {
          selection = {
            preselect = false, -- 🔥 important: Tab selects FIRST item, not second
            auto_insert = true,
          },
        },
      }
    end,
  },
}
