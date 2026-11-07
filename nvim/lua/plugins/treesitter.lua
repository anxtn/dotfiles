require("nvim-treesitter").install({
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "html",
    "javascript",
    "json",
    "latex",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "rust",
    "typescript",
    "tsx",
    "vim",
    "vimdoc",
    "pascal",
    "xml",
    "zig",
})

-- nvim-treesitter (main) doesn't start highlighting itself; markdown needs it
-- for the latex injection inside $...$ / $$...$$
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.treesitter.start(args.buf)
    end,
})
