local c = require 'onedark.colors'
local cfg = vim.g.onedark_config
local highlights = cfg.lualine.highlights

local colors = {
    bg = c.bg0,
    fg = c.fg,
    red = c.red,
    green = c.green,
    yellow = c.yellow,
    blue = c.blue,
    purple = c.purple,
    cyan = c.cyan,
    gray = c.grey,
}

local one_dark = {
    inactive = {
        a = {
            fg = highlights.inactive.a.fg or colors.gray,
            bg = highlights.inactive.a.bg or colors.bg,
            gui = 'bold',
        },
        b = {
            fg = highlights.inactive.b.fg or colors.gray,
            bg = highlights.inactive.b.bg or colors.bg,
        },
        c = {
            fg = highlights.inactive.c.fg or colors.white,
            bg = cfg.lualine.transparent and c.none or highlights.inactive.c.bg or c.bg1,
        },
    },
    normal = {
        a = {
            fg = highlights.normal.a.fg or colors.bg,
            bg = highlights.normal.a.bg or colors.green,
            gui = 'bold',
        },
        b = {
            fg = highlights.normal.b.fg or colors.fg,
            bg = highlights.normal.b.bg or c.bg3,
        },
        c = {
            fg = highlights.normal.c.fg or colors.fg,
            bg = cfg.lualine.transparent and c.none or highlights.normal.c.bg or c.bg1,
        },
    },
    visual = {
        a = {
            fg = highlights.visual.a.fg or colors.bg,
            bg = highlights.visual.a.bg or colors.purple,
            gui = 'bold',
        },
    },
    replace = {
        a = {
            fg = highlights.replace.a.fg or colors.bg,
            bg = highlights.replace.a.bg or colors.red,
            gui = 'bold',
        },
    },
    insert = {
        a = {
            fg = highlights.insert.a.fg or colors.bg,
            bg = highlights.insert.a.bg or colors.blue,
            gui = 'bold',
        },
    },
    command = {
        a = {
            fg = highlights.command.a.fg or colors.bg,
            bg = highlights.command.a.bg or colors.yellow,
            gui = 'bold',
        },
    },
    terminal = {
        a = {
            fg = highlights.terminal.a.fg or colors.bg,
            bg = highlights.terminal.a.bg or colors.cyan,
            gui = 'bold',
        },
    },
}

return one_dark
