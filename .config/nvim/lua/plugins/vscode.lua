return {
    "Mofiqul/vscode.nvim",
    config = function()
        require('vscode').setup({
            style = 'dark',
            transparent = true,
            italic_comments = true,
        })
        vim.cmd.colorscheme("vscode")
    end
}
