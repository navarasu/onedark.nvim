<h1 align="center">
<img height="120" src="https://user-images.githubusercontent.com/20145075/119054213-e1635e80-b9e4-11eb-8a8a-b228c185121a.png" alt="OneDark.nvim">
</h1>

<h4>
<div align="center">
  	<a href="https://github.com/navarasu/onedark.nvim/#installation">Installation</a>
    <span> | </span>
	<a href="https://github.com/navarasu/onedark.nvim/#features">Features</a>
	    <span> | </span>
  	<a href="https://github.com/navarasu/onedark.nvim/#styles">Styles</a>

  <p></p>
</div>
  </h4>

A Dark Theme for neovim >= 0.5 based on [Atom One Dark Theme](https://github.com/atom/atom/tree/master/packages/one-dark-ui) written in lua with [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlight. Additionally, it comes with 5 more color variant styles

## Features
  * 6 styles (default one dark + 5 color variants)
  * Changing the style without exiting Neovim (using shortcut key `<leader>cs` )
  * Supported mulitple plugins with hand picked proper colors

### Plugins Supported
  + [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
  + [LSPDiagnostics](https://neovim.io/doc/user/lsp.html)
  + [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
  + [Telescope](https://github.com/nvim-telescope/telescope.nvim)
  + [WhichKey](https://github.com/liuchengxu/vim-which-key)
  + [Dashboard](https://github.com/glepnir/dashboard-nvim)
  + [Lualine](https://github.com/hoob3rt/lualine.nvim)
  + [GitGutter](https://github.com/airblade/vim-gitgutter)
  + [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
  + [VimFugitive](https://github.com/tpope/vim-fugitive)
  + [DiffView](https://github.com/sindrets/diffview.nvim)

## Styles
### Dark
```vim
colorscheme onedark
```
`Default` - Default one dark theme based on [Atom One Dark Theme](https://github.com/atom/atom/tree/master/packages/one-dark-ui)

 <img alt="onedark" src="https://user-images.githubusercontent.com/20145075/119296900-8301de80-bc77-11eb-8b50-2accd6f8ecb0.png">

### Darker
```vim
let g:onedark_style = 'darker'
colorscheme onedark
```
<img alt="onedark-darker" src="https://user-images.githubusercontent.com/20145075/119296915-872dfc00-bc77-11eb-9bd0-76c6d90f8e4f.png">

### Cool
```vim
let g:onedark_style = 'cool'
colorscheme onedark
```

<img alt="onedark-cool" src="https://user-images.githubusercontent.com/20145075/119296912-85fccf00-bc77-11eb-83b0-bf2138c6758e.png">

### Deep
```vim
let g:onedark_style = 'deep'
colorscheme onedark
```
<img alt="onedark-deep" src="https://user-images.githubusercontent.com/20145075/119296916-885f2900-bc77-11eb-8e96-d6054c94dda1.png">

### Warm
```vim
let g:onedark_style = 'warm'
colorscheme onedark
```
<img alt="onedark-warm" src="https://user-images.githubusercontent.com/20145075/119296920-89905600-bc77-11eb-8cbc-0f1867cafc5f.png">

### Warmer
```vim
let g:onedark_style = 'warmer'
colorscheme onedark
```
<img alt="onedark-warmer" src="https://user-images.githubusercontent.com/20145075/120108433-b914f600-c182-11eb-9b61-59747241839d.png">

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
Install manually
```bash
git clone https://github.com/navarasu/onedark.nvim ~/.config/nvim
nvim +PackerSync
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

By pressing `<leader>cs`, we can switch the style without exiting neovim


## Config
To set style variant of one dark
```vim
let g:onedark_style = 'darker'  " We need add the configs before colorscheme line
colorscheme onedark
```

```lua
-- Lua:
vim.g.onedark_style = 'deep'
require('onedark').setup()
```


## Reference
* [tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim)
* [one-dark-theme](https://github.com/andresmichel/one-dark-theme)

## Contributing

Pull requests are welcome 🎉👍.

## License

[MIT](https://choosealicense.com/licenses/mit/)
