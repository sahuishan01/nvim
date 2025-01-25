local colorSchemePath = vim.fn.stdpath('data') .. '/colorscheme.lua'
local colorFile = io.open(colorSchemePath, "w")
if colorFile then
    colorFile:write("kanagawa-wave")
    colorFile:close()
else
    print("Failed to open the file.")
end
local setColor = io.open(colorSchemePath, "r")
if setColor then
    local colorscheme = setColor:read()  -- Read the colorscheme name from the file
    setColor:close()
    vim.cmd("colorscheme " .. colorscheme)
end

