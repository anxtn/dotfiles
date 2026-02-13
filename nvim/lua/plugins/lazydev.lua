return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        config = function()
            require("lazydev").setup({
                library = {
                    "${3rd}/nvim/library",
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    "plenary.nvim",
                    "telescope.nvim",
                    "nvim-cmp",
                    "mason.nvim",
                    "nvim-treesitter",
                    "nvim-dap",
                    "nvim-dap-ui",
                    "neo-tree",
                    "lazydev",
                    "blink-cmp",
                },
            })
        end,
    }
}
