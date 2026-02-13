--- @param client vim.lsp.Client
--- @return string
local function get_lsp_client_info_str(client)
    local caps_names = {}
    for cap in pairs(client.server_capabilities) do
        table.insert(caps_names, string.format("    -%s\n", cap));
    end

    return string.format([[
name: %s
root dir: %s
id  : %d
caps:
%s
    ]],
        client.name,
        client.root_dir,
        client.id,
        table.concat(caps_names)
    )
end

vim.api.nvim_create_user_command("LspVerboseInfo",
    function(opts)
        local msg = vim.inspect(vim.lsp.get_clients({ bufnr = 0 }))
        vim.fn.setreg("+", msg)
    end,
    { nargs = "*", desc = "Displays important LSP Infos of the current active LSP" }
)


vim.api.nvim_create_user_command(
    "LspInfo",
    function(opts)
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if (clients == nil) or (#clients < 0) then
            vim.notify("No LSP active", vim.log.levels.INFO)
            return
        end
        for _, client in pairs(clients) do
            local msg = get_lsp_client_info_str(client)
            vim.notify(msg, vim.log.levels.INFO);
        end
    end,
    { nargs = "*", desc = "Displays important LSP Infos of the current active LSP" }
)
