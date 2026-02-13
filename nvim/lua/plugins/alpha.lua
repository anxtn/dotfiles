return {
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local startify = require("alpha.themes.startify")
            startify.file_icons.provider = "devicons"
            startify.section.header.val = {
                [[ _______  _______________________   ____.___   _____   ]],
                [[ \      \ \_   _____/\_____  \   \ /   /|   | /     \  ]],
                [[ /   |   \ |    __)_  /   |   \   Y   / |   |/  \ /  \ ]],
                [[/    |    \|        \/    |    \     /  |   /    Y    \]],
                [[\____|__  /_______  /\_______  /\___/   |___\____|__  /]],
                [[        \/        \/         \/                     \/ ]],
            }
            require("alpha").setup(
                startify.config
            )
        end,
    }
}
