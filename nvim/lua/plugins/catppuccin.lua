require("catppuccin").setup({
    -- latte/frappe/macchiato/mocha
    flavour = "mocha",
    transparent_background = false,
    term_colors = true,
    styles = {
        comments = { "italic" },
        keywords = {},
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        telescope = true,
        neotree = true,
    },
})
vim.cmd.colorscheme("catppuccin")
