local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
    return
end

return treesitter.setup {
    ensure_installed = { "c", "c_sharp", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python", "rust" },
    sync_install = false,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
}
