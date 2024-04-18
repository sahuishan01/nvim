local scheme = "tokyonight-night"
local M = {}
local buf = nil
local search_text = ""
local alpha_keys = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
    'u', 'v', 'w', 'x', 'y', 'z' }

local opts = { noremap = true, silent = true }
local cs = "require('plugins.colorscheme')"

local function get_color_themes()
    if search_text ~= "" then
        print(search_text)
    else
        print(" ")
    end
    return vim.fn.getcompletion(search_text, "color", true)
end

local function update_buffer()
    local themes = get_color_themes()
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, themes)
end

-- Define a Lua function to open a new floating buffer
function M.select_color_scheme()
    local width = math.max(math.floor(vim.o.columns / 4), 20)
    local height = math.max(math.floor(vim.o.lines / 4), 20)
    buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        border = 'rounded',
        noautocmd = true,
    })
    vim.api.nvim_command("set nornu")
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

    search_text = ""
    update_buffer()


    vim.api.nvim_command("setlocal winhl=Normal:Normal")
    vim.api.nvim_win_set_option(win, 'wrap', false)

    -- Set key mapping to close buffer when Esc is pressed
    vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<cmd>lua ' .. cs .. '.closeColorScheme()<cr>', opts)
    vim.api.nvim_buf_set_keymap(buf, 'n', "<BS>", "<cmd>lua " .. cs .. ".handleKeyPress('BS')<cr>", opts)
    vim.api.nvim_buf_set_keymap(buf, 'n', "<cr>", "<cmd>lua " .. cs .. ".closeColorScheme(true)<cr>", opts)
    vim.api.nvim_buf_set_keymap(buf, 'n', "<leader>e", "<Cmd>bw!<CR><Cmd>:NvimTreeToggle<CR>", opts)
    vim.api.nvim_buf_set_keymap(buf, 'n', '<C-k>', '<cmd>lua ' .. cs .. '.selectColorScheme(false, "k")<cr>', opts)
    vim.api.nvim_buf_set_keymap(buf, 'n', '<C-j>', '<cmd>lua ' .. cs .. '.selectColorScheme(false, "j")<cr>', opts)
    vim.api.nvim_buf_set_keymap(buf, 'n', '<Tab>', '<cmd>lua ' .. cs .. '.selectColorScheme(false, "x")<cr>', opts)

    for _, v in ipairs(alpha_keys) do
        vim.api.nvim_buf_set_keymap(buf, 'n', v, "<cmd>lua " .. cs .. ".handleKeyPress('" .. v .. "')<cr>", opts)
    end

    vim.api.nvim_buf_set_option(buf, 'modifiable', false)
    vim.api.nvim_command(string.format("autocmd BufLeave <buffer=%s> bwipe!", buf))
end

function M.closeColorScheme(enter)
    enter = enter or false
    if not enter then
        local file_path = string.format("%s/lua/plugins/colorscheme.lua", Vim_path)
        local file = io.open(file_path, "r")
        if file then
            local first_line = file:read()
            local colorscheme = first_line:match('local scheme%s*=%s*"([^"]+)"')
            M.applyColorScheme(colorscheme)
            io.close(file)
        else
            vim.notify("Error: Unable to open the file", "error", { title = "colorscheme.lua" })
        end
    else
        M.selectColorScheme(true)
    end
    print(" ")
    vim.api.nvim_command('bw!')
end

function M.handleKeyPress(key)
    if key == 'BS' then
        search_text = string.sub(search_text, 1, -2)
    else
        search_text = search_text .. key
    end
    vim.api.nvim_buf_set_option(buf, 'modifiable', true)
    update_buffer()
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)
end

function M.selectColorScheme(apply, pressed_key)
    apply = apply or false
    if not apply then
        local current_line_number = vim.api.nvim_call_function('line', { '.' })
        if pressed_key == 'k' then
            current_line_number = current_line_number - 1
        elseif pressed_key == 'j' then
            current_line_number = current_line_number + 1
        end
        vim.api.nvim_command("call cursor(" .. current_line_number .. ", 0)")
    end
    local colorscheme = vim.fn.expand("<cword>")
    if apply then
        M.applyColorScheme(colorscheme, true)
    else
        vim.cmd("colo " .. colorscheme)
    end
end

function M.applyColorScheme(colorscheme, notify)
    notify = notify or false
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
        if buf then
            vim.api.nvim_buf_set_option(buf, 'modifiable', false)
        end
        vim.notify("colorscheme " .. colorscheme .. " not found, reverting to colorscheme 'desert'")
        scheme = "desert"
        vim.cmd [[colo desert]]
    end

    local file_path = string.format("%s/lua/plugins/colorscheme.lua", Vim_path)
    local file = io.open(file_path, "r")
    local file_content = {}
    if file then
        for line in file:lines() do
            table.insert(file_content, line)
        end
        file:close()
        file_content[1] = string.format('local scheme = "%s"', colorscheme)
        local file2 = io.open(file_path, "w")
        if file2 then
            for _, value in ipairs(file_content) do
                file2:write(value .. '\n')
            end
            file2:close()
        end
        if notify then
            vim.notify("colorscheme applied successfully", nil, { title = "colorscheme.lua" })
        end
    else
        vim.notify("Error: Unable to open the file", "error", { title = "colorscheme.lua" })
    end
end

M.applyColorScheme(scheme)

return M
