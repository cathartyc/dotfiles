local language_servers = {
  "lua_ls",
  "basedpyright",
  "clangd",
  "bashls",
  "hyprls",
  "ruff",
  "texlab",
}

return {
  {
    "mason-org/mason.nvim",
    priority = 1000,
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = language_servers
    }
  }
}
