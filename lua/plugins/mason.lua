vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
})
require("mason").setup({})

local present, mason = pcall(require, "mason")
if not present then
    return
end

local options = {
    ensure_installed = {
        "bash-language-server",
        "beautysh",
        "lua-language-server",
        "marksman",
        "taplo",
        "tinymist",
    }, -- not an option from mason.nvim
    max_concurrent_installers = 10,
}

mason.setup(options)

vim.api.nvim_create_user_command("MasonInstallAll", function()
    vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})
