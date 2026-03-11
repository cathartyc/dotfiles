return {
  "Mofiqul/vscode.nvim",
  enabled = false,
  config = function()
    require('vscode').setup({
      style = 'dark',
      transparent = true,
      italic_comments = true,
    })
    vim.cmd.colorscheme("vscode")
  end
}
