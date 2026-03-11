vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buffer = args.buf
    -- inlay hints
    vim.keymap.set("n", "grh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
    end, { buffer = buffer, desc = "Toggle inlay hints" })
    vim.keymap.set("n", "grf", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = buffer, desc = "Format" })
  end
})

return {
  "neovim/nvim-lspconfig",
  lazy = false
}
