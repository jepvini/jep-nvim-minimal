local opt = vim.opt
opt.autoindent = true -- Enable auto indentation
opt.breakindent = true -- keep indentation with wrap lines
opt.colorcolumn = "80" -- Highlight column 80
opt.completeopt = { "menuone", "popup", "noinsert" } -- Options for completion menu
opt.cursorline = true -- Highlight the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.guicursor = "i:block" -- Use block cursor in insert mode
opt.hlsearch = false -- Disable highlighting of search results
opt.ignorecase = true -- Ignore case in search
opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer
opt.list = true -- Show whitespace characters
opt.listchars = "tab: ,multispace:|   ,eol:󰌑" -- Characters to show for tabs, spaces, and end of line
opt.number = true -- Show line numbers
opt.numberwidth = 2 -- Width of the line number column
opt.relativenumber = true -- Show relative line numbers
opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.shiftwidth = 4 -- Number of spaces for autoindent
opt.signcolumn = "yes:1" -- Always show sign column
opt.softtabstop = 4 -- Number of spaces for a tab when editing
opt.swapfile = false -- Disable swap files
opt.tabstop = 4 -- Number of spaces for a tab
opt.termguicolors = true -- Enable true colors
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Directory for undo files
opt.undofile = true -- Enable persistent undo
opt.winborder = "rounded" -- Use rounded borders for windows
opt.wrap = false -- Disable line wrapping
vim.opt.smartcase = true -- smartcase with search

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation

-- Disable autocomment pressing on new line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
