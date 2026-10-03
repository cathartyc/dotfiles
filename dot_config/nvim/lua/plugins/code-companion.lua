return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      http = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              url = "http://worker.carastello.it:11434"
            },
            headers = {
              ["Content-Type"] = "application/json"
            },
            parameters = {
              sync = true,
            },
          })
        end,
      }
    },
    interactions = {
      chat = {
        adapter = "ollama",
        model = "gemma4:latest"
      },
      inline = {
        adapter = "ollama",
        model = "gemma4:latest"
      }
    }
  },
}
