local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.hl.on_yank({ timeout = 170 })
    end,
    group = highlight_group,
})

autocmd({ "BufWritePre" }, {
    callback = function()
        local shebang = vim.api.nvim_buf_get_lines(0, 0, 1, true)[1]

        if not shebang or not shebang:match("^#!.+") then
            return
        end

        autocmd("BufWritePost", {
            callback = function(args)
                local filename = vim.api.nvim_buf_get_name(args.buf)

                local fileinfo = vim.uv.fs_stat(filename)

                if not fileinfo or bit.band(fileinfo.mode - 32768, 0x40) ~= 0 then
                    return
                end

                vim.uv.fs_chmod(filename, bit.bor(fileinfo.mode, 493))
            end,
            once = true,
        })
    end,
    desc = "Mark script files with shebangs as executable on write.",
})
