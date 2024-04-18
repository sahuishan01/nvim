local status_ok, autopairs = pcall(require, 'auto-pairs')
if not status_ok then
    vim.notify("autopairs failed to load" .. autopairs, "error")
    return
end

return autopairs.setup {}
