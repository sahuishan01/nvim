local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
    return
end

return telescope.setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        scroll_strategy = "limit",
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}
