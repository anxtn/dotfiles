require("config.options")
require("config.colorScheme")
require("config.global")
require("config.diagnostic")
require("config.keymap")
require("core.lazy")
require("config.lsp")
require("config.user_command")


require("nvim-treesitter").install {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "html",
    "javascript",
    "json",
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
}
