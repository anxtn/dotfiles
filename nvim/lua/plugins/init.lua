-- Order matters here: catppuccin must load before lualine (theme = "auto"
-- reads the active colorscheme), and mason before mason-lspconfig.
require("plugins.webdevicons")
require("plugins.catppuccin")
require("plugins.lualine")
require("plugins.alpha")
require("plugins.autopairs")
require("plugins.treesitter")
require("plugins.lazydev")
require("plugins.blink_cmp")
require("plugins.mason")
require("plugins.mason_lspconfig")
require("plugins.telescope")
