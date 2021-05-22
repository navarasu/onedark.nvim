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

A Dark Theme for neovim >= 0.5 based on [Atom One Dark Theme](https://github.com/atom/atom/tree/master/packages/one-dark-ui) written in lua with [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlight + 4 more color variant styles

## Features
  * 5 styles (default one dark + 4 color variants)
  * Changing the style without exiting Neovim (using shortcut key `<leader>cs` )
  * Supported mulitple plugins

### Plugins Supported
  + [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
  + [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
  + [Git Gutter](https://github.com/airblade/vim-gitgutter)

## Styles
### Dark
```vim
colorscheme onedark
```
`Default` - Default one dark theme based on [Atom One Dark Theme](https://github.com/atom/atom/tree/master/packages/one-dark-ui)

<img alt="onedark" src="https://user-images.githubusercontent.com/20145075/119232462-14236900-bb43-11eb-9eef-298b30359e40.png">

### Darker
```vim
let g:onedark_style = 'darker'
colorscheme onedark
```
<img alt="onedark-darker" src="https://user-images.githubusercontent.com/20145075/119232750-028e9100-bb44-11eb-817e-0d872facddcc.png">

### Cool
```vim
let g:onedark_style = 'cool'
colorscheme onedark
```
<img alt="onedark-cool" src="https://user-images.githubusercontent.com/20145075/119233009-a9732d00-bb44-11eb-915f-51fba1abfd3b.png">

### Warm
```vim
let g:onedark_style = 'warm'
colorscheme onedark
```
<img alt="onedark-warm" src="https://user-images.githubusercontent.com/20145075/119233022-b859df80-bb44-11eb-9e05-b618b95f0cf8.png">

### Deep
```vim
let g:onedark_style = 'deep'
colorscheme onedark
```
<img alt="onedark-deep" src="https://user-images.githubusercontent.com/20145075/119233058-d45d8100-bb44-11eb-9c51-593eb4526e01.png">

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
require('onedark').set()
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

## Reference
* [tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim)
* [one-dark-theme](https://github.com/andresmichel/one-dark-theme)

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
