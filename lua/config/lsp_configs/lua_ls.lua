local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return {}
end

local M = require("config.lsp_configs.basics")

return lspconfig["lua_ls"].setup{
    capabilities = M.capabilites,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
            return
        end
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    },
    on_attach =  M.on_attach,
}
