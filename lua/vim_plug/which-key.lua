local wk = require("which-key")
wk.add({
-- file group
    { "<leader>f", group = "file" },
    { mode = { "n" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File"},
        { "<leader>fn", desc = "New File" },
      },

-- window group
{ "<leader>w", group = "windows" },
{ mode = { "n" }, group = "windows",
    {
        "<leader>wh", "<C-w>h", proxy = "<C-h>", desc = "Window move focus left"
        },
    {
        "<leader>wj", "<C-w>j", proxy = "<C-j>", desc = "Window move foucs below"
        },
    {
        "<leader>wk", "<C-w>k", proxy = "<C-k>", desc = "Window move foucs above"
        },
    {
        "<leader>wl", "<C-w>l", proxy = "<C-l>", desc = "Window move foucs right"
        },
    {
        "<leader>w<Up>", ":resize -2<cr>", proxy = "<C-Up>", desc = "reduce window height by 2"},
    {
        "<leader>w<Down>", ":resize +2<cr>", proxy = "<C-Down>", desc = "increase window height by 2"},

    {
        "<leader>w<Left>", ":vertical resize -2<cr>", proxy = "<C-Left>", desc = "reduce window width by 2"},
    {
        "<leader>w<Right>", ":vertical resize +2<cr>", proxy = "<C-Right>", desc = "increase window width by 2"},
    },

-- buffer group
{ mode = "n",
    { "<leader>b", group = "buffers", expand = function()
          return require("which-key.extras").expand.buf()
        end,
        },
    { "<leader>bd", ":bd<cr>", group = "buffers", desc = "close current buffer"},
    {
        "<leader>bl", ":bn<cr>", proxy = "<S-l>", group = "buffers", desc = "Next buffer"},
    {
        "<leader>bh", ":bp<cr>", proxy = "<S-h>", group = "buffers", desc = "Next buffer"},
    },
    { mode = "i",
        { "LL", "<cmd>:bn<cr>", group = "buffers", desc = "Next buffer" },
        { "HH", "<cmd>:bp<cr>", group = "buffers", desc = "Previous buffer" },
},

      -- misc
  {
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>s", "<cmd>w<cr>", desc = "Write" },
        {
            "<leader>qq", ":wqa!<cr>", desc = "Force save and quit"
        },
        {
            "<leader>qw", ":qa!<cr>", desc = "Foce Quit without saving"
        },
        {
        }
    }
})
