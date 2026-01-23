-- ~/.config/nvim-new/lua/lsp.lua
vim.lsp.enable({
    "bashls",
    "clangd",
    "lua_ls",
    "marksman",
    "ruff",
    "taplo",
})
vim.diagnostic.config({ virtual_text = true })
