-- lazy.nvim preamble

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
--------------------------------------------------------------------------------
-- vim "classic" options

-- for keybindings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- syntax highlight for doxygen
vim.g.load_doxygen_syntax = 1
-- numbers!
vim.o.number = true
vim.o.relativenumber = true
-- default tab/space stuff
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
-- formatting
vim.o.textwidth = 79
vim.o.wrap = true
vim.o.linebreak = true
--vim.opt.colorcolumn = { "73", "81" }
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:•'
-- extra
vim.o.clipboard = "unnamedplus"
vim.o.exrc = true
-- theme
vim.cmd [[ colorscheme slate ]]
--------------------------------------------------------------------------------
-- lazy setup

require("lazy").setup({
  spec = { { import = "plugins" } },
  install = { colorscheme = { "slate" } },
  checker = { enabled = true },
})
