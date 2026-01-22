-- ~/.config/nvim-new/lua/lsp.lua
vim.lsp.enable({
    "basedpyright",
    "bashls",
    "clangd",
    "lua_ls",
    "marksman",
    "taplo",
})
vim.diagnostic.config({ virtual_text = true })
