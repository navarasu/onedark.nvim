<h1 align="left">
<span> &nbsp;&nbsp;&nbsp; </span>
<img height="100" src="https://user-images.githubusercontent.com/20145075/127218526-44b107db-92b9-4a47-86a3-132b4c1e45d1.png" alt="OneDark.nvim">
</h1>

<h4><div align="right">
    <a href="#installation">Installation</a>
    <span> | </span>
    <a href="#default-configuration">Configuration</a>
    <span> | </span>
    <a href="#customization">Customization</a>
    <span> &nbsp;&nbsp;&nbsp; &nbsp; </span>
</div></h4>

**Dark** and **Light** Themes for neovim >= 0.5 based on [Atom One Dark](https://github.com/atom/atom/tree/master/packages/one-dark-ui) & [Atom One Light](https://github.com/atom/atom/tree/master/packages/one-light-ui) theme written in lua with [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlight.

*For Vim / Neovim < 0.5, prefer [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)*

*For latest [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlight, upgraded to Neovim 0.8.0 or later built with tree-sitter 0.20.3+*

### Features
  * 8 theme styles (One Dark + 5 variants) and (One Light + 1 variant)
  * Supporting multiple plugins with hand picked proper colors
  * Customize `Colors`, `Highlights` and `Code style` of the theme as you like (Refer [Customization](#customization))
  * Toggle the theme style without exiting Neovim using `toggle_style_key` (Refer [Config](#default-configuration))

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
require('onedark').load()
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
require('onedark').load()
```

```vim
" Vim
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark
```

> **Options:**  dark, darker, cool, deep, warm, warmer, light

## Default Configuration

```lua
-- Lua
require('onedark').setup  {
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}
```

### Vimscript configuration

Onedark can be configured also with Vimscript, using the global dictionary `g:onedark_config`.
**NOTE**: when setting boolean values use `v:true` and `v:false` instead of 0 and 1

Example:
``` vim
let g:onedark_config = {
  \ 'style': 'deep',
  \ 'toggle_style_key': '<leader>ts',
  \ 'ending_tildes': v:true,
  \ 'diagnostics': {
    \ 'darker': v:false,
    \ 'background': v:false,
  \ },
\ }
colorscheme onedark
```

## Customization

Example custom colors and Highlights config

```lua
require('onedark').setup {
  colors = {
    bright_orange = "#ff8800",    -- define a new color
    green = '#00ffaa',            -- redefine an existing color
  },
  highlights = {
    ["@keyword"] = {fg = '$green'},
    ["@string"] = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
    ["@function"] = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
    ["@function.builtin"] = {fg = '#0059ff'}
  }
}
```
Note that TreeSitter keywords have been changed after neovim version 0.8 and onwards.
TS prefix is trimmed and lowercase words should be used separated with '.'

The old way before neovim 0.8 looks like this.
For all keywords see [this](https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/highlights.lua#L133-L257) file from line 133 to 257

```lua
require('onedark').setup {
  colors = {
    bright_orange = "#ff8800",    -- define a new color
    green = '#00ffaa',            -- redefine an existing color
  },
  highlights = {
    TSKeyword = {fg = '$green'},
    TSString = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
    TSFunction = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
    TSFuncBuiltin = {fg = '#0059ff'}
  }
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
  + [Mini](https://github.com/echasnovski/mini.nvim)
  + [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
  + [Neotest](https://github.com/nvim-neotest/neotest)

## Reference
* [tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim)
* [one-dark-theme](https://github.com/andresmichel/one-dark-theme)

## Contributing

Pull requests are welcome 🎉👍.

## License

[MIT](https://choosealicense.com/licenses/mit/)
