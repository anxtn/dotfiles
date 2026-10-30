require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "cssls",
        "pyright",
        "vtsls",
        "rust_analyzer",
        "lemminx",
        "zls",
        "jsonls",
        "biome",
        "html",
        "omnisharp",
        "texlab",
    },
})
