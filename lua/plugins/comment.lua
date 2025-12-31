vim.pack.add({
    { src = "https://github.com/numToStr/Comment.nvim" },
})

require('Comment').setup({
    toggler = {
        -- Line-comment toggle keymap
        line = "<space>c",
        -- Block-comment toggle keymap
        block = "<space>bc",
    },
    opleader = {
        -- Line-comment keymap
        line = "<space>c",
        -- Block-comment keymap
        block = "<space>b",
    },
    extra = {
        -- Add comment at the end of line
        eol = "<space>a",
    },
})
