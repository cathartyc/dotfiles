-- vim "classic" options

-- for keybindings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- numbers!
vim.o.number = true
vim.o.relativenumber = true
-- default tab/space stuff
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
-- formatting
--vim.o.textwidth = 79
--vim.o.wrap = true
--vim.o.linebreak = true
--vim.opt.colorcolumn = { "73", "81" }
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:•'
-- extra
vim.o.foldlevelstart = 99
vim.o.clipboard = "unnamedplus"
vim.o.exrc = true
