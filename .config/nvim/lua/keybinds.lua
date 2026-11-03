vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')

-- Press 'jj' in insert mode to escape
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Map Ctrl+c to copy
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Map Ctrl+v to paste
vim.api.nvim_set_keymap('n', '<C-v>', '"+P', { noremap = true, silent = true })

-- Tab navigation
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<C-w>", "<cmd>tabclose<CR>", {
    desc = "Close tab",
    nowait = true,
})

vim.keymap.set("n", "<C-Tab>", "<cmd>tabnext<CR>", {
    desc = "Next tab",
})

vim.keymap.set("n", "<C-S-Tab>", "<cmd>tabprevious<CR>", {
    desc = "Previous tab",
})

-- Window navigation
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Focus left window" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Focus lower window" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Focus upper window" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Focus right window" })

-- Splits
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>s", "<cmd>split<CR>", { desc = "Horizontal split" })
