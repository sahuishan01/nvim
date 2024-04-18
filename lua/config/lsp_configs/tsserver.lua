local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return {}
end

local M = require("config.lsp_configs.basics")

return lspconfig.tsserver.setup {
    on_attach = M.on_attach,
    capabilites = M.capabilites,
}
