-- general theme
vim.cmd [[ colorscheme slate ]]

local BG_COLOR = "#222222"
local FLOAT_BG_COLOR = "#333333"
local COMMENTS_COLOR = "#888888"
-- normal
vim.api.nvim_set_hl(0, "Normal", { bg = BG_COLOR })
-- floating windows (e.g. LSP, errors, etc.)
vim.o.winborder = "shadow"
vim.api.nvim_set_hl(0, "NormalFloat", { bg = FLOAT_BG_COLOR })
vim.api.nvim_set_hl(0, "FloatShadow", { bg = "#000000", blend = 60 })
-- foldings
vim.api.nvim_set_hl(0, "Folded", { bg = FLOAT_BG_COLOR })
-- comments
vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = COMMENTS_COLOR })
