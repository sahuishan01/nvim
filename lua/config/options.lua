Vim_path = vim.fn.stdpath("config")
Current_working_directory = vim.fn.getcwd()
local o = vim.opt

o.shell = "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
o.backup = false
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = { "menuone", "noinsert", "noselect", "preview" }
o.conceallevel = 0
o.fileencoding = "utf-8"
o.hlsearch = true
o.mouse = "a"
o.pumheight = 10
o.showmode = false
o.showtabline = 2
o.smartcase = true
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.termguicolors = true
o.timeoutlen = 1000
o.undofile = true
o.updatetime = 250
o.writebackup = true
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.cursorline = true
o.number = true
o.relativenumber = true
o.numberwidth = 4
o.signcolumn = "yes"
o.wrap = true
o.scrolloff = 8
o.sidescrolloff = 8
o.guifont = "monospace:h17"
o.shortmess:append "c"
o.foldmethod = "indent"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
--vim.api.nvim_create_autocmd('BufWritePre', {
    --callback = function()
        --vim.lsp.buf.format {
            --async = false,
        --}
    --end,
--})
