local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " "       -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.load_doxygen_syntax = 1

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.opt.colorcolumn = { "73", "81" }
vim.o.wrap = true
vim.o.linebreak = true
vim.o.list = true
vim.o.listchars = 'tab:» ,lead:•,trail:•'
vim.o.clipboard = 'unnamedplus'

require("lazy").setup({
    { import = "plugins" },
    checker = { enabled = true },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- vim.env.LAZY .. "/LazyVim", -- see below
                -- You can also add plugins you always want to have loaded.
                -- Useful if the plugin has globals or types you want to use
                -- vim.env.LAZY .. "/LazyVim", -- see below
            },
        },
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        event = {
            'InsertEnter',
            'BufWritePre'
        },
    },
    'mhartington/formatter.nvim',
    "nvim-lua/plenary.nvim",
    -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "hyprlang",
                    "css",
                    "make"
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
        },
        lazy = false,
        branch = "regexp", -- This is the regexp branch, use this for the new version
        config = function()
            local function shorter_name(filename)
                return filename:gsub(os.getenv("HOME"), "~"):gsub("/bin/python", "")
            end

            require("venv-selector").setup {
                settings = {
                    options = {
                        on_telescope_result_callback = shorter_name,
                    },
                    search = {
                        my_venvs = {
                            command = "fd env$ ~/pyenvs -d 1 --full-path",
                        },
                    },
                },
            }
        end,
        keys = {
            { ",v", "<cmd>VenvSelect<cr>" },
        },
    },
    "lewis6991/gitsigns.nvim",
})


require("gitsigns").setup()
require("neoconf").setup()

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "basedpyright",
        "clangd",
        "bashls",
        "matlab_ls",
        "hyprls",
        "ruff"
    }
}

local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities
        }
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["clangd"] = function()
        require 'lspconfig'.clangd.setup {
            capabilities = capabilities
        }
    end,
    ["matlab_ls"] = function()
        require 'lspconfig'.matlab_ls.setup {
            settings = {
                MATLAB = {
                    indexWorkspace = false,
                    installPath = "/usr/local/MATLAB/R2023b",
                    matlabConnectionTiming = "onStart",
                    telemetry = false
                }
            }
        }
    end,
    ["lua_ls"] = function()
        require 'lspconfig'.lua_ls.setup {
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                            -- Depending on the usage, you might want to add additional paths here.
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    }
                })
            end,
            settings = {
                Lua = {}
            },
            capabilities = capabilities
        }
    end,
    ['basedpyright'] = function()
        require 'lspconfig'.basedpyright.setup {
            capabilities = capabilities,
            settings = {
                basedpyright = {
                    -- Using Ruff's import organizer
                    disableOrganizeImports = true,
                },
                python = {
                    analysis = {
                        -- Ignore all files for analysis to exclusively use Ruff for linting
                        ignore = { '*' },
                    }
                },
            }
        }
    end,
}


vim.filetype.add({
    pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang', },
})

--require("nvim-treesitter.configs").setup {
--    highlight = { enabled = true, },
--    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "hyprlang" },
--    auto_install = true,
--}

-- require('telescope').load_extension('fzf')

-- vim.cmd [[
-- augroup HighlightPendingSpaceCharacters
--     autocmd!
--     autocmd GUIEnter,VimEnter,BufNew,WinNew *
--    \   highlight! PendingSpaceCharacters guibg=Green ctermbg=Green
--     \|  call matchadd('PendingSpaceCharacters', '[[:space:]'..']\+$')
-- augroup END
-- ]]

-- Mappings
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buffer = args.buf
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buffer, desc = "Hover" })
        vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code action" })
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { buffer = buffer, desc = "Go to declaration" })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = buffer, desc = "Go to definition" })
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = buffer, desc = "Go to implementation" })
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, { buffer = buffer, desc = "Rename" })
        vim.keymap.set("n", "<leader>gT", vim.lsp.buf.type_definition, { buffer = buffer, desc = "Type definition" })
        vim.keymap.set("n", "<leader>gR", vim.lsp.buf.references, { buffer = buffer, desc = "References" })
        vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, { buffer = buffer, desc = "Signature help" })
        vim.keymap.set("n", "<leader>]d", vim.diagnostic.goto_next, { buffer = buffer, desc = "Next diagnostic" })
        vim.keymap.set("n", "<leader>[d", vim.diagnostic.goto_prev, { buffer = buffer, desc = "Prev diagnostic" })
        vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format {
                timeout_ms = 5000,
            }
        end, { buffer = 0, desc = "Format buffer" })
        vim.keymap.set("n", "<leader>gh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
        end, { buffer = buffer, desc = "Toggle inlay hints" }
        )
    end,
})


vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
