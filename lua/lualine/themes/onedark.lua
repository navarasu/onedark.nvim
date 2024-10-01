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
        a = {fg = colors.gray, bg = colors.bg, gui = 'bold'},
        b = {fg = colors.gray, bg = colors.bg},
        c = {fg = colors.gray, bg = cfg.lualine.transparent and c.none or c.bg1},
    },
    normal = {
        a = {fg = colors.bg, bg = colors.green, gui = 'bold'},
        b = {fg = colors.greem, bg = c.bg3},
        c = {fg = colors.fg, bg = cfg.lualine.transparent and c.none or c.bg1},
    },
    visual = {
    	a = {fg = colors.bg, bg = colors.purple, gui = 'bold'}
        b = {fg = colors.purple, bg = colors.bg3},
    },
    replace = {
        a = {fg = colors.bg, bg = colors.red, gui = 'bold'}
        b = {fg = colors.red, bg = colors.bg3},
    },
    insert = {
        a = {fg = colors.bg, bg = colors.blue, gui = 'bold'}
        b = {fg = colors.blue, bg = colors.bg3},
    },
    command = {
        a = {fg = colors.bg, bg = colors.yellow, gui = 'bold'}
        b = {fg = colors.yellow, bg = colors.bg3},
    },
    terminal = {
        a = {fg = colors.bg, bg = colors.cyan, gui = 'bold'}
        b = {fg = colors.cyan, bg = colors.bg3},
    },
}
return one_dark;
