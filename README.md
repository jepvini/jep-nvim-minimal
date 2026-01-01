# jep-nvim-minimal

This is a simple nvim config based on NeoVim 0.12, using its native package manager

*with love by jep*

## dependencies

simply run the `./check-requirements.sh` to see whats it is missing

## add lsp or formatters

lsp and formatters are managed with [mason](https://github.com/mason-org/mason.nvim?tab=readme-ov-file#installation--usage)
to add a package add it to the `./lua/plugins/mason.lua` and run `:MasonInstallAll` \
enable the lsp in the `./lua/lsp.lua` and the formatter in the `./lua/plugins/conform.lua`
