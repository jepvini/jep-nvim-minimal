vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

require('fzf-lua').setup({
    keymap = {
        -- Below are the default binds, setting any value in these tables will override
        -- the defaults, to inherit from the defaults change [1] from `false` to `true`
        builtin = {
            -- neovim `:tmap` mappings for the fzf win
            -- true,        -- uncomment to inherit all the below in your custom config
            ["<C-h>"] = "hide",
        },
    },
    actions = {
        files = {
            ["ctrl-l"] = FzfLua.actions.file_edit_or_qf,
        },
    }
})
