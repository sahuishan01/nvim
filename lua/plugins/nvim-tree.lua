local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

return nvimtree.setup {
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        side = "right",
        number = true,
        relativenumber = false,
    },
    filters = {
        enable = false,
    },
    renderer = {
        root_folder_label = true,
    }
}
