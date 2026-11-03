local npairs = require("nvim-autopairs")

npairs.setup({
    enabled = function(bufnr)
        local ft = vim.bo[bufnr].filetype

        return vim.tbl_contains({
            "python",
            "c",
            "cpp",
            "sh",
            "bash",
        }, ft)
    end,

    map_cr = true,
})
