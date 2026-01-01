local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<space>", "<Nop>")

-- basic
keymap({ "i" }, "jk", "<esc>")        -- jk as exit
keymap({ "n", "v" }, "J", "<C-d>zz")  -- Scroll down and center the cursor
keymap({ "n", "v" }, "K", "<C-u>zz")  -- Scroll up and center the cursor
keymap({ "n", "x", "v" }, "x", '"_x') -- Delete won't write to internal register
keymap({ "n", "i" }, "<C-l>", "<cmd>bnext<cr>")
keymap({ "n", "i" }, "<C-h>", "<cmd>bprevious<cr>")
keymap("v", "<leader>S", ":sort<cr>") -- sort visual selected lines
keymap("n", "<leader>q", "q")         -- macro

-- testing
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s)               -- Open a new tab
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", s)                -- Split the window vertically
keymap("n", "<Leader>-", "<cmd>split<CR>", s)                 -- Split the window horizontally

keymap("n", "<Leader>jk", ":Format<CR>", s) -- Format the current buffer using LSP
keymap("v", "<Leader>p", '"_dP')                              -- Paste without overwriting the default register
keymap("x", "y", [["+y]], s)                                  -- Yank to the system clipboard in visual mode
keymap("t", "<Esc>", "<C-\\><C-N>")                           -- Exit terminal mode

-- Change directory to the current file's directory
keymap("n", "<leader>CD", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')

-- Update plugins
keymap("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>")

local opts = { noremap = true, silent = true }
keymap("n", "<leader>i", "<cmd>lua vim.lsp.buf.hover()<cr>")
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
keymap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>")
keymap("n", "<leader>nn", "<cmd>lua vim.lsp.buf.rename()<cr>")


-- fzf
keymap("n", "<leader>ff", "<cmd>FzfLua files<CR>")
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>")

-- fugitive
keymap("n", "<leader>gs", "<cmd>Git<CR>", opts)
keymap("n", "<leader>gp", "<cmd>Git push<CR>", opts)

-- yazi
keymap("n", "<leader>e", function()
    require("yazi").yazi()
end)
