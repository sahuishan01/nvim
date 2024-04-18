local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    vim.notify("bufferline not found", "error")
    return
end

return bufferline.setup {
    options = {
        indicator = {
            style = "underline",
        },
        themable = true,
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
    }
}
