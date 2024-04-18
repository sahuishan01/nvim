local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    vim.notify("Which key not found", 1)
    return
end

vim.g.mapleader = " "

local normal_opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local insert_opts = {
    mode = "i",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local visual_opts = {
    mode = "v",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local telescope_okay, builtin = pcall(require, 'telescope.builtin')
if telescope_okay then
    which_key.register({
        f = {
            name = "+file",
            f = { builtin.find_files, "Find File" },
            g = { builtin.live_grep, "Live Grep" },
            b = { builtin.buffers, "Buffer Search" },
            h = { builtin.help_tags, "Help Tage" },
            s = { builtin.current_buffer_fuzzy_find, "Search in current buffer" },
            d = { builtin.lsp_definitions, "Go to definition" },
            i = { builtin.lsp_implementations, "Go to implementation" },
            r = { builtin.oldfiles, "View Recently opened files" },
        }
    }, normal_opts)
end

local nvimTree_okay, nvimTree = pcall(require, 'nvim-tree.api')
if nvimTree_okay then
    which_key.register({
        ["e"] = { nvimTree.tree.toggle, "Toogle File Explorer"}
    }, normal_opts)
else
    vim.notify("Nvimtree api not found", 1)
end

-- Window navigation
which_key.register({
    ["<C-h>"] = { "<C-w>h", "Switch to left window"},
    ["<C-j>"] = { "<C-w>j", "Switch to below window"},
    ["<C-k>"] = { "<C-w>k", "Switch to above window"},
    ["<C-l>"] = { "<C-w>l", "Switch to right window"},

    ["<C-Up>"]= {":resize +2<cr>", "Increase size vertically"},
    ["<C-Down>"] = { ":resize -2<cr>", "Decrease size vertically"},
    ["<C-Left>"] = { ":vertical resize -2<cr>", "Decrease size horizontally"},
    ["<C-Right>"] = { ":vertical resize +2<cr>", "Increase size horizontally"},
})

-- Buffer Windows
which_key.register({
    ["LL"] = { "<cmd>:bn<cr>", "Go to Next Buffer"},
    ["HH"] = { "<cmd>:bp<cr>", "Go to Previous Buffer"},
},
    { mode = {"i"} }
)

which_key.register({
    ["L"] = { "<cmd>:bn<cr>", "Go to Next Buffer"},
    ["H"] = { "<cmd>:bp<cr>", "Go to Previous Buffer"},
    ["<a-j>"] = { ":m .+1<cr>", "move line down" },
    ["<a-k>"] = { ":m .-2<cr>", "move line down" },
},
    { mode = {"n"} }
)
-- Basic Shortcuts
which_key.register({
    ["<C-s>"] = { "<cmd>w<cr>", "Save current buffer"},
    ["<DEL>"] = { '"_x', "Delete without copying"},
    ["<C-DEL>"] = { '"_dw', "Delete next word without copying"},
    ["<C-BS>"] = { '"_db', "Delete previous word without copying"},
    ["<BS>"] = { '"_x', "Delete current letter without copying"},
    ["<C-x>"] = { '"_x', "Delete current letter without copying"},
}, { mode = "n"})

which_key.register({
    ["jk"] = {"<ESC>", "Escape insert mode" },
    ["<C-s>"] = { "<cmd>w<cr><Esc>", "Save and escape insert mode"},
}, { mode = "i" })

-- Quit and Delete
which_key.register({
    q = {
        name = "+quit",
        q = { ":qa!<cr>", "force quit all buffers" },
        w = { ":wqa!<cr>", "force save and quit all buffers" },
        b = { ":bd!<cr>", "force close current buffer"},
    },
    d = {
        name = "delete",
        d = {'"_dd', "Delete without copying"},
        w = {'"_dw', "Delete next word without copying"},
        b = {'"_db', "Delete previous word without copying"},
    },
    c = {
        h = { '<cmd>lua require("plugins.colorscheme").select_color_scheme()<CR>', "Select ColorScheme" }
    },
}, normal_opts )

-- Indentation 
which_key.register({
    [">"] = {">gv", "Indent Right"},
    ["<"] = {"<gv", "Indent Left"},
    ["<A-j>"] = {":m .+1<cr>=", "Move selection down" },
    ["<A-k>"] = {":m .-2<cr>=", "Move selection Up" }
}, { mode = "v"})

-- Cmd escape
which_key.register({
 ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Escape terminal ang go to left window"},
 ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Escape terminal ang go to below window"},
 ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Escape terminal ang go to above window"},
 ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Escape terminal ang go to right window"},
}, { mode = "t"})

-- Colorscheme
return which_key.setup()
