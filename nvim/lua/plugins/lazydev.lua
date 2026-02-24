return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        ---@module 'lazydev'
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                "${3rd}/nvim/library",
            },
        },
        --
        --
        --config = function()
        --require("lazydev").setup({
        --library = {
        --"${3rd}/nvim/library",
        --{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
        --"plenary.nvim",
        --"telescope.nvim",
        --"nvim-cmp",
        --"mason.nvim",
        --"mason-lspconfig.nvim",
        --"nvim-treesitter",
        --"nvim-dap",
        --"nvim-dap-ui",
        --"neo-tree",
        --"lazydev",
        --"blink.cmp",
        --"alpha-nvim",
        --"nvim-autopairs",
        --"nvim-treesitter",
        --"lualine.nvim",
        --"nvim-web-devicons",
        --},
        --})
        --end,
    }
}
