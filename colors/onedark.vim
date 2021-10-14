lua << EOF
for k in pairs(package.loaded) do
    if k:match(".*onedark.*") then package.loaded[k] = nil end
end

vim.g.onedark_toggle_style_keymap = vim.g.onedark_toggle_style_keymap or '<leader>cs'
vim.api.nvim_set_keymap('n', vim.g.onedark_toggle_style_keymap, [[<Cmd>lua require('onedark').toggle()<CR>]], { noremap = true, silent = true })

require('onedark').setup()
EOF

