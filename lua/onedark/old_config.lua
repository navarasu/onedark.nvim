local function load_old_config()
    local opts = { "style", "toggle_style_keymap", "transparent_background", "italic_comment", "diagnostics_undercurl", "darker_diagnostics", "diagnostics_text_bg", "disable_terminal_colors", "hide_ending_tildes" }

    local cfg = {}
    local using_old_config = false
    local messages = ""
    for _, opt in ipairs(opts) do
        local value = vim.g["onedark_" .. opt]
        if value ~= nil then
            cfg[opt] = value
            using_old_config = true
            messages = messages .. "onedark.nvim: option 'onedark_" .. opt .. "' has been deprecated. See how to use the new configuration in README.md\n"
        end
    end

    if using_old_config then
        vim.schedule(function() vim.notify(messages, vim.log.levels.WARN, { title = "onedark.nvim" }) end)
        -- some values need to be inverted before applying them to new config
        if cfg.disable_terminal_colors ~= nil then cfg.disable_terminal_colors = not cfg.disable_terminal_colors end
        if cfg.hide_ending_tildes ~= nil then cfg.hide_ending_tildes = not cfg.hide_ending_tildes end
        if cfg.italic_comment ~= nil then cfg.italic_comment = cfg.italic_comment and 'italic' or 'none' end
        local new_config = {
            style = cfg.style,
            toggle_style_key = cfg.toggle_style_keymap,
            transparent = cfg.transparent_background,
            term_colors = cfg.disable_terminal_colors,
            ending_tildes = cfg.hide_ending_tildes,
            code_style = {
                comment = cfg.italic_comment,
            },
            diagnostics = {
                darker = cfg.darker_diagnostics,
                undercurl = cfg.diagnostics_undercurl,
                background = cfg.diagnostics_text_bg,
            }
        }
        return new_config
    else
        return false
    end
end

return load_old_config()
