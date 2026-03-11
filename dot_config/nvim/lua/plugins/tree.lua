return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  opts = {},
  keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Open the tree" } },
}
