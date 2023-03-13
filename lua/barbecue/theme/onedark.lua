local c = require("onedark.colors")

return {
    normal = {
        bg = c.none,
        fg = c.light_grey,
    },
    ellipsis = { fg = c.grey }, -- Conceal's or Normal's fg
    separator = { fg = c.grey }, -- Conceal's or Normal's fg
    modified = { fg = c.green }, -- BufferVisibleMod's fg (a yellow color)
    dirname = {},
    basename = { fg = c.fg },
    context = {},
    context_file = { fg = c.blue }, -- CmpItemKindFile's fg
    context_module = { fg = c.orange }, -- CmpItemKindModule's fg
    context_namespace = { fg = c.orange }, -- CmpItemKindModule's fg
    context_package = { fg = c.orange }, -- CmpItemKindModule's fg
    context_class = { fg = c.yellow }, -- CmpItemKindClass's fg
    context_method = { fg = c.blue }, -- CmpItemKindMethod's fg
    context_property = { fg = c.cyan }, -- CmpItemKindProperty's fg
    context_field = { fg = c.purple }, -- CmpItemKindField's fg
    context_constructor = { fg = c.blue }, -- CmpItemKindConstructor's fg
    context_enum = { fg = c.purple }, -- CmpItemKindEnum's fg
    context_interface = { fg = c.green }, -- CmpItemKindInterface's fg
    context_function = { fg = c.blue }, -- CmpItemKindFunction's fg
    context_variable = { fg = c.purple }, -- CmpItemKindVariable's fg
    context_constant = { fg = c.orange }, -- CmpItemKindConstant's fg
    context_string = { fg = c.green }, -- String's fg
    context_number = { fg = c.orange }, -- Number's fg
    context_boolean = { fg = c.orange }, -- Boolean's fg
    context_array = { fg = c.purple }, -- CmpItemKindStruct's fg
    context_object = { fg = c.purple }, -- CmpItemKindStruct's fg
    context_key = { fg = c.purple }, -- CmpItemKindVariable's fg
    context_null = { fg = c.red }, -- Special's fg
    context_enum_member = { fg = c.yellow }, -- CmpItemKindEnumMember's fg
    context_struct = { fg = c.purple }, -- CmpItemKindStruct's fg
    context_event = { fg = c.yellow }, -- CmpItemKindEvent's fg
    context_operator = { fg = c.red }, -- CmpItemKindOperator's fg
    context_type_parameter = { fg = c.red }, -- CmpItemKindTypeParameter's fg
}
