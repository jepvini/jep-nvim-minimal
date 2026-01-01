vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
    formatters_by_ft = {
        -- c = { "clang_format" },
        -- cpp = { "clang_format" },
        -- json = { "jq" },
        -- tex = { "tex-fmt" },
        -- lua = { "stylua" },
        -- markdown = { "mdformat" },
        -- python = { "isort", "black" },
        sh = { "beautysh" },
        -- toml = { "taplo" },

        ["*"] = { "trim_whitespace", "trim_newlines" },
    },
})

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_format = "last", range = range })
end, { range = true })
