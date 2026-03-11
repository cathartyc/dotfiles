vim.lsp.enable('rust_analyzer')
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format()
  end
})
