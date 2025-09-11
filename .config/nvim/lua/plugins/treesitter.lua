local languages = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "hyprlang",
    "css",
    "make",
    "python"
}

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = languages,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
