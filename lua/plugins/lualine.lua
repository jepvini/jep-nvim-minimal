vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

vim.pack.add({
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({
    options = {
        theme = {
            normal = {
                a = { bg = "#b4befe", fg = "#1e1e2e", gui = "bold" },
                b = { bg = "#1e1e2e", fg = "#b4befe" },
                c = { bg = "#1e1e2e", fg = "#b4befe" },
            },
            insert = {
                a = { bg = "#a6e3a1", fg = "#1e1e2e", gui = "bold" },
                b = { bg = "#1e1e2e", fg = "#a6e3a1" },
                c = { bg = "#1e1e2e", fg = "#a6e3a1" },
            },
            visual = {
                a = { bg = "#cba6f7", fg = "#1e1e2e", gui = "bold" },
                b = { bg = "#1e1e2e", fg = "#cba6f7" },
                c = { bg = "#1e1e2e", fg = "#cba6f7" },
            },
            replace = {
                a = { bg = "#f38ba8", fg = "#1e1e2e", gui = "bold" },
                b = { bg = "#1e1e2e", fg = "#f38ba8" },
                c = { bg = "#1e1e2e", fg = "#f38ba8" },
            },
            command = {
                a = { bg = "#fab387", fg = "#1e1e2e", gui = "bold" },
                b = { bg = "#1e1e2e", fg = "#fab387" },
                c = { bg = "#1e1e2e", fg = "#fab387" },
            },
            inactive = {
                a = { bg = "#6c7086", fg = "#1e1e2e", gui = "bold" },
                b = { bg = "#1e1e2e", fg = "#6c7086" },
                c = { bg = "#1e1e2e", fg = "#6c7086" },
            },
        },
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = { "NvimTree" },
        },
    },

    sections = {
        lualine_a = { "mode" },
        lualine_b = { "buffers", "branch", "diff", "diagnostics" },
        lualine_c = {
            {
                "searchcount",
                maxcount = 999,
                timeout = 500,
            },
        },
        lualine_x = {
            {
                "lsp_status",
                icon = "",
                symbols = {
                    -- Standard unicode symbols to cycle through for LSP progress:
                    spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                    -- Standard unicode symbol for when LSP is done:
                    done = "✓",
                    -- Delimiter inserted between LSP names:
                    separator = " ",
                },
                -- List of LSP names to ignore (e.g., `null-ls`):
                ignore_lsp = {},
                -- Display the LSP name
                show_name = true,
            },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
})
