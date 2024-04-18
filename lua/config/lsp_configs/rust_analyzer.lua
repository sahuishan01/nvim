local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    print("here")
    return {}
end

local M = require("config.lsp_configs.basics")

return lspconfig["rust_analyzer"].setup{
    capabilites = M.capabilites,
    on_attach = M.on_attach,
    settings = {
        ["rust_analyzer"] = {
--            diagnostics = {
--                enable = false;
--            }
            typing = {
                autoClosingAngleBrackets = {
                    enable = true,
                },
            }
        }
    }
}
