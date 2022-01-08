for k in pairs(package.loaded) do
    if k:match(".*onedark.*") then package.loaded[k] = nil end
end

require('onedark').setup()
require('onedark').colorscheme()
