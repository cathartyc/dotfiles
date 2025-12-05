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
-- vim settings, such as wrap, textwidth, fold, etc.
require("config.vim_options")
-- theme/highlight settings
require("config.theme")
-- custom commands
require("config.commands")
--------------------------------------------------------------------------------
-- lazy setup
require("lazy").setup({
  spec = { { import = "plugins" } },
  install = { colorscheme = { "slate" } },
  checker = { enabled = true },
})
