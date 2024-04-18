local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return {}
end

local M = require("config.lsp_configs.basics")

local venv_path = Current_working_directory .. "/venv"

return lspconfig.pyright.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilites,
    --cmd = { "pylsp" },
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
                venvPath = venv_path,
            }
        }
    },
}
