return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',
        ---@module 'blink-cmp'
        opts = {
            keymap = {
                preset = "default",

                ['<C-j>'] = { 'select_next', 'fallback' },
                ['<C-k>'] = { 'select_prev', 'fallback' },
                ['<Tab>'] = { 'accept', 'fallback' }
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
                default = { 'lsp', 'path', 'buffer', 'lazydev', 'snippets' },
                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        score_offset = 100,
                    }
                }
            },

            fuzzy = {
                implementation = "prefer_rust_with_warning",
            },
        },
        opts_extend = { "sources.default" }
    }
}
