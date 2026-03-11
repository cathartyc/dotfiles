vim.api.nvim_set_keymap('n', '<leader>vt', ":vsplit<CR><C-W>l:terminal<CR>", { desc = "Open terminal in vertical split"})
vim.api.nvim_set_keymap('n', '<leader>ht', ":belowright split | terminal<CR>", { desc = "Open terminal in horizontal split"})
