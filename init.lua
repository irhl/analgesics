-- dependencies:
-- https://github.com/bakpakin/Fennel
-- + /blob/main/bootstrap/fennel.lua
--
-- > ~/.config/nvim/lua/libs/fennel.lua
local fennel = require 'libs.fennel'

-- this is no good idea, but compared to the command: 
-- os.execute(fennel --compile "file.fnl")
-- this barely have noticeable delay
local dir_fnl = os.getenv('HOME') .. '/.config/nvim/fnl/'
local dir_lua = os.getenv('HOME') .. '/.config/nvim/lua/'
for _, file in ipairs(vim.fn.readdir(dir_fnl)) do
    if file:match('%.fnl$') then
        local type_fnl = io.open(dir_fnl .. file):read('*a')
        local type_lua = fennel.compileString(type_fnl)
        local output = io.open(dir_lua .. file:gsub('%.fnl$', '.lua'), 'w')
        output:write(type_lua)
        output:close()
    end
end

-- load .lua files converted from .fnl
local source = vim.fn.expand(dir_lua)
local read = vim.fn.readdir(source)
for _, plugin in ipairs(read) do
    if plugin:match('%.lua$') then
        pcall(dofile, source .. plugin)
    end
end

-- :help lua-loader
vim.loader.enable()

-- load plugins
vim.cmd('packloadall')
