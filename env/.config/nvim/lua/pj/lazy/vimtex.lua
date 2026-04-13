return {
    "lervag/vimtex",
    ft = "tex",
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk"
        -- if you use treesitter for other filetypes, disable vimtex's syntax where needed
        vim.g.vimtex_syntax_enabled = 1
    end,
}
