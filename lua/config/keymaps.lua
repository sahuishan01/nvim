local opts = { noremap = true, silent = true }

--local term_opts = { silent = true }

local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize -2<cr>", opts)
keymap("n", "<C-Down>", ":resize +2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- File Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Buffer window
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bnext<cr>", opts)

keymap("i", "jk", "<ESC>", opts)

-- Indentation
keymap("v", ">", ">gv", opts)
keymap("v", ">", ">gv", opts)

-- Moving lines
keymap("n", "<A-j>", ":m .+1<cr>", opts)
keymap("n", "<A-k>", ":m .-2<cr>", opts)

keymap("v", "<A-j>", ":m .+1<cr>=", opts)
keymap("v", "<A-k>", ":m .-2<cr>=", opts)
keymap("v", "p", '"_dP', opts)

keymap("x", "<A-j>", ":move '>+1<cr>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<cr>gv-gv", opts)

-- Cmd escape
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Colorscheme
keymap('n', '<leader>ch', '<cmd>lua require("plugins.colorscheme").select_color_scheme()<CR>', opts)

-- Basic Shortcuts
keymap("n", "<C-s>", "<cmd>w<cr>", opts)
keymap("i", "<C-s>", "<cmd>w<cr><Esc>", opts)

keymap("n", "<leader>qw", ":wqa!<cr>", opts)
keymap("n", "<leader>qq", ":qa!<cr>", opts)

keymap("n", "<DEL>", '"_x', opts)
keymap("n", "<C-DEL>", '"_dw', opts)
keymap("n", "<C-BS>", '"_db', opts)
keymap("n", "<leader>dd", '"_dd', opts)
keymap("n", "<leader>dw", '"_dw', opts)
keymap("n", "<leader>db", '"_db', opts)
keymap("n", "<BS>", '"_x', opts)
keymap("n", "<C-x>", 'x', opts)
keymap("v", "<C-x>", 'd', opts)

keymap("i", "jj", "<Esc>", opts)

keymap("i", "LL", "<cmd>:bn<cr>", opts)
keymap("i", "HH", "<cmd>:bp<cr>", opts)
keymap("n", "<S-l>", "<cmd>:bn<cr>", opts)
keymap("n", "<S-h>", "<cmd>:bp<cr>", opts)

-- Telescopevim.notify("Buffer success")
local status_ok, builtin = pcall(require, 'telescope.builtin')
if status_ok then
    keymap('n', '<leader>ff', builtin.find_files, opts)
    keymap('n', '<leader>fg', builtin.live_grep, opts)
    keymap('n', '<leader>fb', builtin.buffers, opts)
    keymap('n', '<leader>fh', builtin.help_tags, opts)
    keymap('n', '<leader>fs', builtin.current_buffer_fuzzy_find, opts)
    keymap('n', '<leader>fd', builtin.lsp_definitions, opts)
    keymap('n', '<leader>fi', builtin.lsp_implementations, opts)
end

local status_ok, bufferline = pcall(require, 'bufferline')
if status_ok then
    keymap('n', '<leader>qb', '<cmd>bdelete!<cr>', opts)
end
