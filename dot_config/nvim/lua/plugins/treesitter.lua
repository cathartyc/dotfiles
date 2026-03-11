local languages = {
  "c",
  "lua",
  "rust",
  "vim",
  "vimdoc",
  "query",
  "hyprlang",
  "css",
  "make",
  "python",
  "markdown",
  "markdown_inline",
}

vim.api.nvim_create_autocmd("FileType", {
  callback = function(opts)
    local lang = opts.match
    local ok = pcall(vim.treesitter.language.inspect, lang)
    if ok then
      pcall(vim.treesitter.start) -- auto-detects buffer + lang
      -- enable LSP folding
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldmethod = 'expr'
    end
  end,
})

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = 'main',
  build = ":TSUpdate",
  opts = {
    ensure_installed = languages
  }
}
