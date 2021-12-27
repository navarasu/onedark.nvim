local M = {}

M.styles_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }
M.styles = { dark = 1, darker = 2, cool = 3, deep = 4, warm = 5, warmer = 6 , light = 7 }

---Change onedark style (vim.g.onedark_config.style)
---It can't be changed by modifing that field due to a Neovim lua bug with global variables (onedark_config is a global variable)
---@param style string
function M.change_style(style)
    vim.g.onedark_config = vim.tbl_extend('force', vim.g.onedark_config, { style = style })
end

---Apply the colorscheme (same as ':colorscheme onedark')
function M.colorscheme()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.o.termguicolors = true
    vim.g.colors_name = "onedark"
    if vim.o.background == 'light' then
        M.change_style('light')
    elseif vim.g.onedark_config.style == 'light' then
        M.change_style(M.styles_list[1])
    end
    require('onedark.highlights').setup()
    require('onedark.terminal').setup()
end

---Toggle between onedark styles
function M.toggle()
    local index = M.styles[vim.g.onedark_config.style] + 1
    if index > #M.styles_list then index = 1 end
    vim.o.background = index >= 7 and 'light' or 'dark'
    M.change_style(M.styles_list[index])
    vim.api.nvim_command('colorscheme onedark')
end

local default_config = {
    -- Main options --
    style = 'dark',    -- choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    toggle_style_key = '<leader>ts',
    toggle_style_list = M.styles_list,
    transparent = false,     -- don't set background
    term_colors = true,      -- if true enable the terminal
    ending_tildes = false,    -- show the end-of-buffer tildes

    -- Changing Formats --
    format = {
        comment = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Related --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl for diagnostics
        background = true,    -- use background color for virtual text
    },
}

local first_time_setup = true
---Setup onedark.nvim options, without applying colorscheme
---@param opts table: a table containing options
function M.setup(opts)
    if first_time_setup then
        first_time_setup = false
        if not vim.g.onedark_config then
            vim.g.onedark_config = default_config
            local old_config = require('onedark.old_config')
            if old_config then opts = old_config end
        else
            vim.g.onedark_config = vim.tbl_deep_extend('keep', vim.g.onedark_config, default_config)
        end
    end
    if opts then
        vim.g.onedark_config = vim.tbl_deep_extend('force', vim.g.onedark_config, opts)
    end
    vim.api.nvim_set_keymap('n', vim.g.onedark_config.toggle_style_key, '<cmd>lua require("onedark").toggle()<cr>', { noremap = true, silent = true })
end

return M
