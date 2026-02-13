return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "none",
                ["<Tab>"] = { "select_next", "fallback", },
                ["<S-Tab>"] = { "select_prev", "fallback", },
                ['<C-space>'] = { "show", "fallback", },
            },

            appearance = {
                nerd_font_variant = 'mono',
            },

            completion = {
                documentation = {
                    auto_show_delay_ms = 0,
                    auto_show = true,
                }
            },

            sources = {
                default = { 'lsp', 'path' },
            },

            fuzzy = {
                implementation = "prefer_rust_with_warning",
            },
        },
        opts_extend = { "sources.default" }
    }
}
