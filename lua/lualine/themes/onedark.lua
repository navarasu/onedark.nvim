local c = require('onedark.colors')
local cfg = vim.g.onedark_config
local colors = {
    bg = c.bg0,
    fg = c.fg,
    red = c.red,
    green = c.green,
    yellow = c.yellow,
    blue = c.blue,
    purple = c.purple,
    cyan = c.cyan,
    gray = c.grey
}

local one_dark = {
    inactive = {
        a = {fg = colors.gray, bg = cfg.lualine.transparent and c.none or colors.bg, gui = 'bold'},
        b = {fg = colors.gray, bg = cfg.lualine.transparent and c.none or colors.bg},
        c = {fg = colors.gray, bg = cfg.lualine.transparent and c.none or c.bg1},
    },
    normal = {
        a = {fg = cfg.lualine.transparent and c.green or colors.bg, bg = cfg.lualine.transparent and c.none or colors.green, gui = 'bold'},
        b = {fg = colors.fg, bg = cfg.lualine.transparent and c.none or c.bg3},
        c = {fg = colors.fg, bg = cfg.lualine.transparent and c.none or c.bg1},
    },
    visual = {a = {fg = cfg.lualine.transparent and c.purple or colors.bg, bg = cfg.lualine.transparent and c.none or colors.purple, gui = 'bold'}},
    replace = {a = {fg = cfg.lualine.transparent and c.red or colors.bg, bg = cfg.lualine.transparent and c.none or colors.red, gui = 'bold'}},
    insert = {a = {fg = cfg.lualine.transparent and c.blue or colors.bg, bg = cfg.lualine.transparent and c.none or colors.blue, gui = 'bold'}},
    command = {a = {fg = cfg.lualine.transparent and c.yellow or colors.bg, bg = cfg.lualine.transparent and c.none or colors.yellow, gui = 'bold'}},
    terminal = {a = {fg = cfg.lualine.transparent and c.cyan or colors.bg, bg = cfg.lualine.transparent and c.none or colors.cyan, gui = 'bold'}},
}
return one_dark;
