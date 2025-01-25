local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug ('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug ('nvim-tree/nvim-web-devicons')
Plug ('nvim-tree/nvim-tree.lua')
Plug ('folke/tokyonight.nvim')
Plug ('akinsho/bufferline.nvim', { ['tag'] = '*' })
Plug ('rebelot/kanagawa.nvim')
Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim')
Plug ('folke/which-key.nvim')

vim.call('plug#end')

require("vim_plug/nvimTree")
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

require("vim_plug.coc")
require("vim_plug.colorscheme")
require("bufferline").setup{}
require("vim_plug.which-key")

