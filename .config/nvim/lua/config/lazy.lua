local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
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
--vim.o.listchars = 'tab:» ,trail:•'
vim.o.clipboard = "unnamedplus"
vim.o.textwidth = 72
vim.o.exrc = true

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		"lewis6991/gitsigns.nvim",
	},
	install = { colorscheme = { "carbonfox" } },
	checker = { enabled = true },
})

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- Mappings
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local buffer = args.buf
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buffer, desc = "Hover" })
		vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code action" })
		vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { buffer = buffer, desc = "Go to declaration" })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = buffer, desc = "Go to definition" })
		vim.keymap.set(
			"n",
			"<leader>gi",
			vim.lsp.buf.implementation,
			{ buffer = buffer, desc = "Go to implementation" }
		)
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, { buffer = buffer, desc = "Rename" })
		vim.keymap.set("n", "<leader>gT", vim.lsp.buf.type_definition, { buffer = buffer, desc = "Type definition" })
		vim.keymap.set("n", "<leader>gR", vim.lsp.buf.references, { buffer = buffer, desc = "References" })
		vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, { buffer = buffer, desc = "Signature help" })
		vim.keymap.set("n", "<leader>gh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
		end, { buffer = buffer, desc = "Toggle inlay hints" })
		vim.keymap.set("n", "<leader>gf", function()
			require("conform").format()
		end, { buffer = 0, desc = "Format buffer" })
		--diagnostics
		vim.keymap.set("n", "<leader>]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { buffer = buffer, desc = "Next diagnostic" })
		vim.keymap.set("n", "<leader>[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { buffer = buffer, desc = "Prev diagnostic" })
		local diagnostics_vals = {
			{ "e", vim.diagnostic.severity.ERROR, "error" },
			{ "w", vim.diagnostic.severity.WARN, "warning" },
			{ "i", vim.diagnostic.severity.INFO, "info" },
			{ "h", vim.diagnostic.severity.HINT, "hint" },
		}
		for _, diag in ipairs(diagnostics_vals) do
			vim.keymap.set("n", "<leader>[" .. diag[1], function()
				vim.diagnostic.jump({ count = -1, float = true, severity = diag[2] })
			end, { buffer = buffer, desc = "Prev " .. diag[3] })
			vim.keymap.set("n", "<leader>]" .. diag[1], function()
				vim.diagnostic.jump({ count = 1, float = true, severity = diag[2] })
			end, { buffer = buffer, desc = "Next " .. diag[3] })
		end
	end,
})
