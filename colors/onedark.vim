lua << EOF
for k in pairs(package.loaded) do
    if k:match(".*onedark.*") then package.loaded[k] = nil end
end
vim.api.nvim_set_keymap('n', '<leader>cs', [[<Cmd>lua require('onedark').toggle()<CR>]], { noremap = true, silent = true })
require('onedark').set()
EOF

