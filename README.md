
<h1 align="left">
	 <span> &nbsp;&nbsp;&nbsp; </span>
<img height="90" src="https://user-images.githubusercontent.com/20145075/127218526-44b107db-92b9-4a47-86a3-132b4c1e45d1.png" alt="OneDark.nvim">
</h1>
<h4>
	<div align="right">
  	<a href="https://github.com/navarasu/onedark.nvim/#installation">Installation</a>
    <span> | </span>
	<a href="https://github.com/navarasu/onedark.nvim/#features">Features</a>
	    <span> | </span>
  	<a href="https://github.com/navarasu/onedark.nvim/#themes">Themes</a>
			    <span> | </span>
  	<a href="https://github.com/navarasu/onedark.nvim/#configuration">Configuration</a>
					    <span> &nbsp;  &nbsp; </span>

  <p></p>
	</div></h4>

**Dark** and **Light** Themes for neovim >= 0.5 based on [Atom One Dark](https://github.com/atom/atom/tree/master/packages/one-dark-ui) & [Atom One Light](https://github.com/atom/atom/tree/master/packages/one-light-ui) theme written in lua with [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlight.

*For Vim / Neovim < 0.5, prefer [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)*

## Features
  * 8 color themes (one dark + 5 dark color variants + one light +  1 light variants  )
  * Changing the style without exiting Neovim (using shortcut key `<leader>cs`. If you want to change or disable this mapping see [toggle style](#toggle-style))
  * Supported mulitple plugins with hand picked proper colors

## Themes
<p float="left">
<img alt="onedark-cool" height= "600px" src="https://user-images.githubusercontent.com/20145075/143786545-c49d9870-5d8d-4020-bc13-f96e1f8664fe.png">
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

### Requirements

+ [Neovim >= 0.5.0](https://github.com/neovim/neovim/releases/tag/nightly)

## Usage

Enable the colorscheme:
```vim
" Vim-Script:
colorscheme onedark
```

```lua
-- Lua:
require('onedark').setup()
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

## Enable lualine
To Enable the `onedark` theme for `Lualine`, specify theme as `onedark`:

```lua
require('lualine').setup {
  options = {
    theme = 'onedark'
    -- ... your lualine config
  }
}
```
## Toggle style 
By pressing `<leader>cs`, we can switch the style without exiting Neovim.

If you want to change this mapping:
``` lua
vim.g.onedark_toggle_style_keymap = '<space>tc'
```
If you want to disable this mapping completely:
``` lua
vim.g.onedark_toggle_style_keymap = '<nop>'
```

## Configuration
**Important:** you need to add the configs before changing colorscheme

### Onedark options
| Variable name                     | Default value  | Description                                                                   |
| -------------                     | -------------  | -------------                                                                 |
| `onedark_style`                   | `'dark'`       | change style variant of one dark                                              |
| `onedark_transparent_background`  | `false`        | enable transparent background                                                 |
| `onedark_italic_comment`          | `true`         | enable italic comments                                                        |
| `onedark_toggle_style_keymap`     | `'<leader>cs'` | set toggle style keymap (see [toggle style](#toggle-style))                   |
| `onedark_disable_terminal_colors` | `false`        | disable terminal colors                                                       |
| `onedark_diagnostics_undercurl`   | `true`         | use curly underline (undercurl) instead of standard underline for diagnostics |
| `onedark_darker_diagnostics`      | `true`         | show diagnostics using a darker color                                         |
| `onedark_hide_ending_tildes`      | `false`        | hide end of buffer tildes                                                     |

### Configure onedark.nvim using vimscript:
```vim
let g:onedark_style = 'darker'
let g:<onedark_option> = 'value'
colorscheme onedark
```
When using vimscript to configure onedark settings **be sure** to use `v:true` and `v:false` to set booleand values!
``` vim
let g:onedark_italic_comment = v:true        " don't use 0 or 1
```

### Configure onedark.nvim using lua:
```lua
vim.g.onedark_style = 'deep'
vim.g.onedark_italic_comment = false
vim.g.<onedark_option> = 'value'
require('onedark').setup()
```

## Reference
* [tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim)
* [one-dark-theme](https://github.com/andresmichel/one-dark-theme)

## Contributing

Pull requests are welcome 🎉👍.

## License

[MIT](https://choosealicense.com/licenses/mit/)
