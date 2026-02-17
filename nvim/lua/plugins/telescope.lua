return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>ft", "<cmd>Telescope live_grep<CR>",  desc = "Find Text" },
    },
    config = function()
        require("telescope").setup({
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    additional_args = function(opts)
                        return { "--hidden" }
                    end
                },
            }
        })
    end,
}
