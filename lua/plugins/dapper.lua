local status_ok, dap = pcall(require, 'dap')
if not status_ok then
    vim.notify("dap not found", 1)
    return
end

local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
    vim.notify('dap-ui not found', 1)
    return
end

local status_ok, neodev = pcall(require, 'neodev')
if status_ok then
    neodev.setup({
    library  = { plugins = { 'nvim-dap-ui' }, types = true},
    })
end

dap.set_log_level('INFO')

local pythonPath = function()
    local cwd = vim.fn.getcwd()
    local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
    local python_in_venv = "bin/python"
    if is_windows then 
        python_in_venv = 'Scripts/python.exe'
    end
    if vim.fn.executable(cwd .. '/venv/python.exe') == 1 then
        return cwd .. '/venv/python.exe'
    elseif vim.fn.executable(cwd .. '/venv/python') == 1 then
        return cwd .. '/venv/python'
    elseif vim.fn.executable(cwd .. '/venv/' .. python_in_venv) == 1 then
        return cwd .. '/venv/bin/python'
    elseif vim.fn.executable(cwd .. '/.venv/' .. python_in_venv) == 1 then
        return cwd .. '/.venv/' .. python_in_venv
    else
        return ''
      end
end


dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch';
        name = "Launch file";
        program = "${file}"; -- This configuration will launch the current file if used.
        pythonPath = pythonPath()
    }
}
dap.adapters.python = {
    type = 'executable';
    command = pythonPath();
    args = { '-m', 'debugpy.adapter' };
}

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
return dapui.setup()
