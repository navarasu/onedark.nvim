local function get(setting, default)
    local key = "onedark_" .. setting
    if vim.g[key] == nil then return default end
    return vim.g[key]
end

local config = {
    bg = get("transparent_background", false),
    italic_comment = get("italic_comment", true),
}

return config
