local M = require("config.lsp_configs.basics")

for _, lsp in ipairs(M.servers) do
    local status_ok, _ = pcall(require, 'config.lsp_configs.' .. lsp)
    if not status_ok then
        print(lsp .. " not found")
    end
end
