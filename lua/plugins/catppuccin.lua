vim.pack.add({
    { src = "https://github.com/catppuccin/nvim" },
})

require("catppuccin").setup({
    highlight_overrides = {
        mocha = function(mocha)
            return {
                LineNr = { fg = mocha.yellow },
                ["@comment"] = { fg = mocha.overlay0, style = { "italic" } },
            }
        end,
    },
    term_colors = true,
    transparent_background = true,
    float = {
        transparent = true, -- enable transparent floating windows
        solid = true,       -- use solid styling for floating windows, see |winborder|
    },
    dim_inactive = {
        enabled = false,         -- dims the background color of inactive window
    },
    styles = {                   -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = { "bold" },
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        harpoon = true,
        telescope = true,
    },
})

vim.cmd.colorscheme("catppuccin-mocha")
