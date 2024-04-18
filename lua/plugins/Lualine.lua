local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    vim.notify("Lualine not found", 1)
    return
end

return lualine.setup()
