return {
  'stevearc/conform.nvim',
  enabled = false,
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
      rust = { 'rustfmt' }
    }
  }
}
