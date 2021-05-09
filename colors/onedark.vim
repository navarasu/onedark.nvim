lua << EOF
for k in pairs(package.loaded) do
    if k:match(".*onedark.*") then package.loaded[k] = nil end
end
EOF

lua require('onedark').setup()

