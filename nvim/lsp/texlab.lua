-- match VimTeX's latexmk out_dir (lua/plugins/vimtex.lua)
---@type vim.lsp.Config
return {
    settings = {
        texlab = {
            build = {
                auxDirectory = "build",
                logDirectory = "build",
                pdfDirectory = "build",
            },
        },
    },
}
