---@type vim.lsp.Config
return {
    cmd = { "DelphiLSP.exe" },
    filetypes = { "pas", "pascal" },
    root_markers = {".delphilsp.json", ".dpr", ".dproj", },
    root_dir = vim.fn.getcwd(),
}
