<h1 align="left">
<img height="120" src="https://user-images.githubusercontent.com/20145075/119054213-e1635e80-b9e4-11eb-8a8a-b228c185121a.png" alt="OneDark.nvim">
</h1>

<h4>
<div align="right">
  	<a href="https://github.com/navarasu/onedark.nvim/#installation">Installation</a>
    <span> | </span>
	<a href="https://github.com/navarasu/onedark.nvim/#features">Features</a>
  <p></p>
</div>
  </h4>

A Dark Theme for neovim 0.5 based on [Atom One Dark Theme](https://github.com/atom/atom/tree/master/packages/one-dark-ui) written in lua with [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlight

<img  alt="OneDark.nvim" src="https://user-images.githubusercontent.com/20145075/118363557-97c4df00-b5b2-11eb-8be5-8fdf3b71948b.png">


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

## Features

### Plugins Supported
  + [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
  + [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
  + [Git Gutter](https://github.com/airblade/vim-gitgutter)

## Reference
* [tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim)
* [one-dark-theme](https://github.com/andresmichel/one-dark-theme)


## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
