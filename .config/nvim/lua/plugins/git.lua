return {
  "lewis6991/gitsigns.nvim",
  keys = {
      { "<leader>g",  group = "Git", desc = "git (gitsigns)" },
      { "<leader>gb", function() require("gitsigns").blame_line() end, desc = "blame line" },
      { "<leader>gs",  group = "stage", desc = "stage" },
      { "<leader>gsh", function() require("gitsigns").stage_hunk() end, desc = "stage hunk" },
      { "<leader>gsf", function() require("gitsigns").stage_buffer() end, desc = "stage buffer" },
      { "<leader>gr",  group = "reset", desc = "reset" },
      { "<leader>grh", function() require("gitsigns").reset_hunk() end, desc = "reset hunk" },
      { "<leader>grb", function() require("gitsigns").reset_buffer() end, desc = "reset buffer" },


  }
}
