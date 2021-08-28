local M = {}
vim.g.onedark_style = vim.g.onedark_style or 'dark'
local highlights = require('onedark.highlights')
local terminal = require('onedark.terminal')

local function colorscheme()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.o.background = "dark"
    vim.o.termguicolors = true
     vim.g.colors_name = "onedark"
    highlights.setup()
    terminal.setup()
end

function M.toggle()
    local styles = { 'dark', 'darker', 'cool', 'deep', 'warm' , 'warmer'}
    local index={}
    for k,v in pairs(styles) do index[v]=k end
    vim.g.onedark_style = styles[index[vim.g.onedark_style] + 1] or 'dark'
    vim.cmd[[colorscheme onedark]]
 end

function M.setup() colorscheme() end

return M
