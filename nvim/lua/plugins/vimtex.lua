vim.g.vimtex_view_method = "zathura_simple"

-- keep latexmk artifacts (aux, log, pdf, ...) out of the source directory
vim.g.vimtex_compiler_latexmk = {
    out_dir = "build",
}
