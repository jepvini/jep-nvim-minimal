-- Dict
vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
})
vim.pack.add({
    { src = "https://github.com/dwyl/english-words.git" },
})
vim.pack.add({
    { src = "https://github.com/Kaiser-Yang/blink-cmp-dictionary" },
})

-- Snippets
vim.pack.add({
    { src = "https://github.com/rafamadriz/friendly-snippets" },
})

-- Blink
vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({
    fuzzy = { implementation = "rust" },
    signature = { enabled = true },
    keymap = {
        preset = "default",
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-h>'] = { 'hide', 'fallback' },
        ['<C-CR>'] = { 'select_and_accept', 'fallback' },

        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },

        ['<C-m>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-n>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
        list = {
            selection = {
                preselect = true,
                auto_insert = true,
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
        },
    },

    cmdline = {
        completion = {
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false,
                },
            },
            menu = {
                auto_show = true
            },
        },
        keymap = {
            preset = "inherit",
            ["<CR>"] = { "accept_and_enter", "fallback" },
        },
    },

    sources = {
        default = { 'lsp', 'buffer', 'path', 'snippets', 'dictionary' },
        providers = {
            dictionary = {
                module = 'blink-cmp-dictionary',
                -- Make sure this is at least 2.
                -- 3 is recommended
                min_keyword_length = 3,
                opts = {
                    dictionary_files = { vim.fn.expand('~/.local/share/nvim/site/pack/core/opt/english-words/words_alpha.txt') }
                },
            },
            path = {
                opts = {
                    get_cwd = function(_)
                        return vim.fn.getcwd()
                    end,
                },
            },
            lsp = {
                fallbacks = {},
                name = 'LSP',
                module = 'blink.cmp.sources.lsp',
                transform_items = function(_, items)
                    return vim.tbl_filter(function(item)
                        return item.kind ~= require('blink.cmp.types').CompletionItemKind.Keyword
                    end, items)
                end,
            },
        },
    },
})
