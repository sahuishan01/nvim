local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not vim.loop.fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            "--filter=blob:none",
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add {
    -- Notification
    {
        'rcarriga/nvim-notify',
    };

    -- --Colorschemes
    "LunarVim/Colorschemes";
    "folke/tokyonight.nvim";
    "catppuccin/nvim";
    "rebelot/kanagawa.nvim";
    'tomasiser/vim-code-dark';

    -- -- Completion
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-cmdline';
    'neovim/nvim-lspconfig';
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-nvim-lsp';
    'saadparwaiz1/cmp_luasnip';
    'L3MON4D3/LuaSnip';

    -- -- LSP
    --'williamboman/mason.nvim';
    --'williamboman/mason-lspconfig.nvim';

    -- --Telescope
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } },
    };

    -- -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
            ts_update()
        end,
    };

    -- Comments
    {
        'numToStr/Comment.nvim',
    };

    -- Auto pair
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    };

    -- Git Signs
    {
        'lewis6991/gitsigns.nvim',
    };

    --File Explorer
    {
        'nvim-tree/nvim-tree.lua',
        requrires = { 'nvim-tree/nvim-web-devicons' },
    };

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
    };

    -- ToggleTerm
    {
        'akinsho/toggleterm.nvim'
        -- config = function()
        --     require("terminal").setup()
        -- end
    };

    -- Dubugger
    {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        config = function ()
            require("plugins.dapper")
        end
    };

    -- Alpha dashboard
    {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    };

    {
        'rmagatti/auto-session',
        config = function()
                require("auto-session").setup {
                  log_level = "error",
                  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
                }
        end
    };

    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    };

    {
      "folke/which-key.nvim",
      config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
     end
    };
}

require("plugins.Notify")
require("plugins.colorscheme")
require("plugins.cmp")
require("plugins.lsp")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.comment")
--require("plugins.autopairs")
require("plugins.gitsigns")
require("plugins.nvim-tree")
require("plugins.Bufferline")
require("plugins.terminal")
require("plugins.Lualine")
require("plugins.whichKey")
