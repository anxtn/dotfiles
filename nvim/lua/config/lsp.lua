local format = {
    c = "clangd",
    cpp = "clangd",
    css = "biome",
    javascript = "biome",
    javascriptreact = "biome",
    json = "biome",
    jsonc = "biome",
    lua = "lua_ls",
    rust = "rust_analyzer",
    typescriptreact = "biome",
    typescript = "biome",
    python = "pyright",
    zig = "zls",
    html = "html",
    xml = "lemminx"
}

local logic = {
    c = "clangd",
    cpp = "clangd",
    css = "cssls",
    javascript = "vtsls",
    javascriptreact = "vtsls",
    json = "jsonls",
    jsonc = "jsonls",
    lua = "lua_ls",
    rust = "rust_analyzer",
    typescriptreact = "vtsls",
    typescript = "vtsls",
    python = "pyright",
    zig = "zls",
    html = "html",
    xml = "lemminx"
}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local ft = vim.bo[args.buf].filetype;
        if not client then return end

        local format_client = format[ft];
        local logic_client = logic[ft]

        ---@param severity vim.diagnostic.Severity | nil
        local function bind_qf_diagnostics(keys, severity, desc)
            vim.keymap.set(
                "n",
                keys,
                function()
                    vim.diagnostic.setqflist({ open = true, severity = severity })
                end,
                { buffer = bufnr, noremap = true, silent = true, desc = desc }
            )
        end

        if client.name == logic_client then
            bind_qf_diagnostics('<leader>la', nil, 'LSP: Show qf diagnostics');
            bind_qf_diagnostics('<leader>le', "ERROR", 'LSP: Show qf errors');
            bind_qf_diagnostics('<leader>lw', "WARN", 'LSP: Show qf warning');
            bind_qf_diagnostics('<leader>lh', "HINT", 'LSP: Show qf hints');
        end

        if client.name == logic_client then
            vim.keymap.set(
                "n",
                "gd",
                function()
                    vim.lsp.buf.definition({ id = client.id })
                    vim.notify(string.format('lsp definition [%s]', client.name));
                end,
                { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Go to definition" }
            )
        end

        if client.name == format_client then
            vim.keymap.set(
                "n",
                "<leader>lf",
                function()
                    vim.lsp.buf.format({ id = client.id })
                    vim.notify(string.format('lsp format [%s]', client.name));
                end,
                { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Format file" }
            )
        end
    end,
})
