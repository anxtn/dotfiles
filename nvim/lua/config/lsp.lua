vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then return end

        local caps = client.server_capabilities

        if not caps then return end

        vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Go to definition" }
        )

        vim.keymap.set(
            "n",
            "<leader>la",
            function()
                vim.diagnostic.setqflist({ open = true })
            end,
            { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Show all diagnostics" }
        )

        vim.keymap.set(
            "n",
            "<leader>le",
            function()
                vim.diagnostic.setqflist({ open = true, severity = "ERROR" })
            end,
            { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Show all errors" }
        )

        vim.keymap.set(
            "n",
            "<leader>lw",
            function()
                vim.diagnostic.setqflist({ open = true, severity = "WARN" })
            end,
            { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Show all warnings" }
        )

        if client.name ~= 'vtsls' then
            vim.keymap.set(
                "n",
                "<leader>lf",
                function()
                    vim.lsp.buf.format({ id = client.id })
                end,
                { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Format file" }
            )
        end
    end,
})
