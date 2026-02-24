---@type vim.lsp.Config
return {
    settings = {
        typescript = {
            tsserver = {
                pluginPaths = { "typescript-plugin-css-modules" }
            }
        }
    }
}
