local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<space>", "<Nop>")

-- basic
keymap({ "i" }, "jk", "<esc>")          -- jk as exit
keymap({ "n", "v" }, "J", "<C-d>zz")    -- Scroll down and center the cursor
keymap({ "n", "v" }, "K", "<C-u>zz")    -- Scroll up and center the cursor
keymap({ "n", "x", "v" }, "x", '"_x')   -- Delete won't write to internal register
keymap({ "n", "x", "v" }, "mm", '"_dd') -- Delete line without putting it to the internal register
keymap({ "n", "i" }, "<C-l>", "<cmd>bnext<cr>")
keymap({ "n", "i" }, "<C-h>", "<cmd>bprevious<cr>")
keymap("v", "<leader>S", ":sort<cr>") -- sort visual selected lines
keymap("n", "<leader>q", "q")         -- macro as q is q

-- fold
keymap("n", "za", "zA") -- toggle max fold
keymap("n", "zr", "zR") -- unfold all
keymap("n", "ze", "zM") -- fold all


-- testing
keymap("n", "<Leader>_", "<cmd>vnew<CR>", s) -- Split the window vertically
keymap("n", "<Leader>-", "<cmd>new<CR>", s)  -- Split the window horizontally

keymap("n", "<Leader>jk", ":Format<CR>", s)  -- Format the current buffer using LSP
keymap("x", "y", [["+y]], s)                 -- Yank to the system clipboard in visual mode

-- Change directory to the current file's directory
keymap("n", "<leader>CD", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')

-- Update plugins
keymap("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>")

-- LSP
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
keymap("n", "<leader>r", "<cmd>FzfLua oldfiles<CR>")
keymap("n", "<leader>ff", "<cmd>FzfLua files<CR>")
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>")
keymap("n", "<leader>fr", "<cmd>FzfLua registers<CR>")
keymap("n", "<leader>fm", "<cmd>FzfLua manpages<CR>")
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<CR>")
keymap("n", "<leader>fl", "<cmd>FzfLua lsp_live_workspace_symbols<CR>")
keymap("n", "<leader>fp", "<cmd>FzfLua complete_path<CR>")
keymap("n", "<leader>gd", "<cmd>FzfLua lsp_definitions<CR>")
keymap("n", "<leader>gi", "<cmd>FzfLua lsp_implementations<CR>")
keymap("n", "<leader>x", "<cmd>FzfLua diagnostics_document<CR>")
keymap("n", "<leader>fx", "<cmd>FzfLua diagnostics_workspace<CR>")
keymap("n", "<leader>gs", "<cmd>FzfLua git_status<CR>")

-- git signs
keymap("n", "<leader>gp", "<cmd>Gitsign preview_hunk_inline<CR>")
keymap("n", "<leader>gb", "<cmd>Gitsign blame_line<CR>")

-- trouble
-- keymap("n", "<leader>x", "<cmd>Trouble diagnostics toggle focus=true<cr>")

-- yazi
keymap("n", "<leader>e", function()
    require("yazi").yazi()
end)
