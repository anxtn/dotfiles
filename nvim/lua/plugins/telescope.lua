require("telescope").setup({
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function(opts)
                return { "--hidden" }
            end,
        },
    },
})

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", { desc = "Find Text" })
