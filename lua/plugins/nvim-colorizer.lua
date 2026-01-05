vim.pack.add({
    { src = "https://github.com/catgoose/nvim-colorizer.lua" },
})

require('colorizer').setup({ -- set to setup table
    lazy_load = true,
    filetypes = { "*" },
    user_default_options = {
        names = false,        -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
        names_custom = false, -- Custom names to be highlighted: table|function|false
        RGB = true,           -- #RGB hex codes
        RGBA = true,          -- #RGBA hex codes
        RRGGBB = true,        -- #RRGGBB hex codes
        RRGGBBAA = true,      -- #RRGGBBAA hex codes
        AARRGGBB = true,      -- 0xAARRGGBB hex codes
        rgb_fn = true,        -- CSS rgb() and rgba() functions
        hsl_fn = true,        -- CSS hsl() and hsla() functions
        css = true,           -- Enable all CSS *features*:
        -- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn
        css_fn = false,
    },
})
