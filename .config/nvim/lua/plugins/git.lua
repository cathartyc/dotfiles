return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {
    current_line_blame_opts = {
      delay = 250
    }
  },
  keys = {
      { "<leader>g",  group = "git", desc = "git (gitsigns)" },
      { "<leader>gb", group = "blame", desc = "Blame" },
      { "<leader>gbl", function() require("gitsigns").blame_line({full = true}) end, desc = "Blame line" },
      { "<leader>gbt", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle inline blame" },

      { "<leader>gs",  group = "stage", desc = "Stage" },
      { "<leader>gsh", function() require("gitsigns").stage_hunk() end, desc = "Stage/unstage hunk" },
      { "<leader>gsh", function() require("gitsigns").stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, mode = "v", desc = "Stage selection" },
      { "<leader>gsf", function() require("gitsigns").stage_buffer() end, desc = "Stage buffer" },

      { "<leader>gr",  group = "reset", desc = "Reset" },
      { "<leader>grh", function() require("gitsigns").reset_hunk() end,    desc = "Reset hunk" },
      { "<leader>grh", function() require("gitsigns").reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, mode = "v", desc = "Reset selection" },
      { "<leader>grb", function() require("gitsigns").reset_buffer() end,  desc = "Reset buffer" },

      { "<leader>gd", group = "diff", desc = "Diff"},
      { "<leader>gdf", function() require("gitsigns").diffthis() end, desc = "Diff file" },
      { "<leader>gdt", function() require("gitsigns").toggle_word_diff() end, desc = "Toggle word diff" },

      { "<leader>gq", group = "quickfix", desc = "List changes"},
      { "<leader>gqf", function() require("gitsigns").setqflist() end, desc = "Show changed hunks" },
      { "<leader>gqF", function() require("gitsigns").setqflist('all') end, desc = "Show changed hunks everywhere" },


      { "[c", function() require("gitsigns").nav_hunk('prev') end, desc = "git: previous change" },
      { "]c", function() require("gitsigns").nav_hunk('next') end, desc = "git: next change" },

  }
}
