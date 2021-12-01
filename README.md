<h1 align="left">
<span> &nbsp;&nbsp;&nbsp; </span>
<img height="100" src="https://user-images.githubusercontent.com/20145075/127218526-44b107db-92b9-4a47-86a3-132b4c1e45d1.png" alt="OneDark.nvim">
</h1>

<h4><div align="right">
    <a href="#installation">Installation</a>
    <span> | </span>
    <a href="#configuration">Configuration</a>
    <span> | </span>
    <a href="#features">Customization</a>
    <span> &nbsp;&nbsp;&nbsp; &nbsp; </span>
</div></h4>

**Dark** and **Light** Themes for neovim >= 0.5 based on [Atom One Dark](https://github.com/atom/atom/tree/master/packages/one-dark-ui) & [Atom One Light](https://github.com/atom/atom/tree/master/packages/one-light-ui) theme written in lua with [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlight.

*For Vim / Neovim < 0.5, prefer [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)*

### Features
  * 8 theme styles (One Dark + 5 variants) and (One Light + 1 variant)
  * Supporting multiple plugins with hand picked proper colors
  * Customize `Colors`, `Highlights` and `Code style` of the theme as you like (Refer [Customization](#customization))
  * Toggle the theme style without exiting Neovim using shortcut `<leader>tts` (Refer [Default Config](#deafult-configuration))

## Themes
<p float="left">
<img width="412" alt="Onedark - dark" src="https://user-images.githubusercontent.com/20145075/144289835-cbbbcb22-4eae-41f1-a5a3-e1800a37ae41.png">
<img width="412" alt="Onedark - darker" src="https://user-images.githubusercontent.com/20145075/144293945-ee3b7dca-b119-4709-96d3-50391c7b8aba.png">
</div></p>
<p float="left">
<img width="412" alt="Onedark - cool" src="https://user-images.githubusercontent.com/20145075/144298826-5c51eb3a-5529-4fe7-bce2-56508eda93d7.png">
<img width="412" alt="Onedark - deep" src="https://user-images.githubusercontent.com/20145075/144299487-a7e886c7-2cc9-4d85-9aac-8517170432fc.png">
</div></p>
<p float="left">
<img width="412" alt="Onedark - warm" src="https://user-images.githubusercontent.com/20145075/144304677-abbf6cc1-4adc-48b4-b675-6f6a5a98b426.png">
<img width="412" alt="Onedark - warmer" src="https://user-images.githubusercontent.com/20145075/144304700-1e333a12-6994-4fb2-9053-1e7f294d41a6.png">
</div></p>

## Installation
Install via your favourite package manager
```vim
" Using Vim-Plug
Plug 'navarasu/onedark.nvim'
```

```lua
-- Using Packer
use 'navarasu/onedark.nvim'
```

## Configuration

### Enable theme
    
```lua
-- Lua
require('onedark').setup {}
```
    
```vim
" Vim
colorscheme onedark 
```

### Change default style
    
```lua
-- Lua
require('onedark').setup {
    style = 'darker'
}
```
    
```vim
" Vim
let g:onedark_style = 'darker'
colorscheme onedark
```

> **Options:**  dark, darker, cool, deep, warm, warmer

## Default Configuration

```lua 
-- Lua
require('onedark').setup  { 
    -- Main options --
     style = 'dark', -- Default theme style
     transparency = 1,  -- Change background opacity from 0 - 1 
     term_colors = true, -- Change terminal color as per the selected theme style
     ending_tilde = false, -- show the end-of-buffer tildes. By default they are hidden
     
     -- Plugins Config --
     diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl for diagnostics
        background = true,    -- use background color for virtual text
     },
     
     -- Change code style ---
     -- Options are italic, bold, underline, NONE
     -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
     code_style = {
       comment = 'italic'
       keywords = 'NONE', 
       functions = 'NONE', 
       strings = 'NONE',
       variables = 'NONE'
     },

    -- Custom Highlights --
     colors = {}, -- Override default colors
     highlights = {}, -- Override highlight groups

     -- toggle theme style ---
     toggle_style_key = '<leader>tts', -- Default keybinding to toggle
     toggle_style_list = ['dark', 'darker', 'cool', 'deep', 'warm', 'warmer'], --list of styles to toggle amoung
 }
 ```

## Plugins Configuration

### Enable lualine
To Enable the `onedark` theme for `Lualine`, specify theme as `onedark`:

```lua
require('lualine').setup {
  options = {
    theme = 'onedark'
    -- ... your lualine config
  }
}
```

## Customization

> TODO


## Plugins Supported
  + [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
  + [LSPDiagnostics](https://neovim.io/doc/user/lsp.html)
  + [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
  + [Telescope](https://github.com/nvim-telescope/telescope.nvim)
  + [WhichKey](https://github.com/folke/which-key.nvim)
  + [Dashboard](https://github.com/glepnir/dashboard-nvim)
  + [Lualine](https://github.com/hoob3rt/lualine.nvim)
  + [GitGutter](https://github.com/airblade/vim-gitgutter)
  + [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
  + [VimFugitive](https://github.com/tpope/vim-fugitive)
  + [DiffView](https://github.com/sindrets/diffview.nvim)
  + [Hop](https://github.com/phaazon/hop.nvim)

## Reference
* [tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim)
* [one-dark-theme](https://github.com/andresmichel/one-dark-theme)

## Contributing

Pull requests are welcome 🎉👍.

## License

[MIT](https://choosealicense.com/licenses/mit/)
