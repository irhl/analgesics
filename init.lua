-- :help lua-loader
vim.loader.enable()

-- load plugins
vim.cmd('packloadall')

-- dependencies:
-- https://github.com/bakpakin/Fennel
-- + blob/main/bootstrap/fennel.lua
--
-- > ~/.config/nvim/lua/libs/fennel.lua
local fennel = require 'libs.fennel'
local dir = os.getenv("HOME") .. "/.config/nvim/fnl/"

for _, file in ipairs(vim.fn.readdir(dir)) do
    if file:match("%.fnl$") then
        fennel.dofile(dir .. file, {compilerEnv = _G})
    end
end
