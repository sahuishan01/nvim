local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("i", "<Esc>", "<Esc>:nohls", opts)

keymap("i", "jk", "<Esc>", opts)
keymap("i", "<C-s>", "<Esc><cmd>w<cr>a", opts)
keymap("i", "<C-.>", "<C-T>", opts)
keymap("i", "<C-,>", "<C-D>", opts)

keymap("i", "LL", "<cmd>:bn<cr>", opts)
keymap("i", "HH", "<cmd>:bp<cr>", opts)


keymap("n", "<C-.>", ">>", opts)
keymap("n", "<C-,>", "<<", opts)
keymap("n", "<C-s>", ":w<cr>", opts)
keymap("n", "<DEL>", '"_x', opts)
keymap("n", "x", '"_x', opts)
keymap("n", "_x", '"x', opts)
keymap("n", "<C-DEL>", '"_dw', opts)
keymap("n", "<C-BS>", '"_db', opts)
keymap("n", "dd", '"_dd', opts)
keymap("n", "dw", '"_dw', opts)
keymap("n", "db", '"_db', opts)
keymap("n", "_dd", '"dd', opts)
keymap("n", "_dw", '"dw', opts)
keymap("n", "_db", '"db', opts)
keymap("n", "<BS>", '"_x', opts)
keymap("n", "<C-x>", 'x', opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize -2<cr>", opts)
keymap("n", "<C-Down>", ":resize +2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

keymap("n", "<leader>qq", ":wqa!<cr>", opts)
keymap("n", "<leader>qw", ":qa!<cr>", opts)

keymap("n", "<S-l>", "<cmd>:bn<cr>", opts)
keymap("n", "<S-h>", "<cmd>:bp<cr>", opts)

keymap("v", "<C-x>", 'd', opts)
keymap("v", "d", '"_d', opts)
keymap("v", ">", ">gv", opts)

