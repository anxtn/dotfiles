-- Run build-equivalent hooks after a plugin is installed/updated via vim.pack.
-- Must be registered before the first vim.pack.add() call so it fires on
-- initial install too.
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local kind = ev.data.kind
        if kind ~= "install" and kind ~= "update" then
            return
        end

        local name = ev.data.spec.name
        if name ~= "mason.nvim" and name ~= "nvim-treesitter" then
            return
        end

        -- The plugin's own commands aren't registered yet at this point
        -- unless it's already loaded, so make sure it is first.
        if not ev.data.active then
            vim.cmd.packadd(name)
        end

        if name == "mason.nvim" then
            vim.cmd("MasonUpdate")
        else
            vim.cmd("TSUpdate")
        end
    end,
})

vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/goolord/alpha-nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/rafamadriz/friendly-snippets",
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/lervag/vimtex",
})
