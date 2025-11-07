# Changelog

All notable changes to onedark.nvim will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased] - 2025-11-08

### 🚨 Breaking Changes

- **Minimum Neovim version now 0.9.0+**
  - For Neovim 0.5-0.8, use [v0.1.0](https://github.com/navarasu/onedark.nvim/tree/v0.1.0)
  - Enables modern TreeSitter captures and LSP semantic tokens

- **TreeSitter capture names modernized** (#217)
  - `@markup.emphasis` → `@markup.italic`
  - `@markup.strike` → `@markup.strikethrough`
  - Removed deprecated `@text.*` captures (use `@markup.*` instead)
  - Removed `@annotation`, `@error`, `@warning`, `@danger`, `@note` (use comment variants)
  - See [nvim-treesitter standard](https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights)

### ✨ Added

#### New Highlight Groups

- **Diagnostic improvements** (#225)
  - `DiagnosticOk` (green) - for successful/ok diagnostics
  - `DiagnosticUnnecessary` (grey) - for unnecessary code (unused variables, imports)
  - `DiagnosticDeprecated` (orange, strikethrough) - for deprecated code
  - All with VirtualText and Underline variants

- **Git conflict markers** (#235)
  - `GitConflictCurrent` / `GitConflictCurrentLabel` (green) - HEAD/current changes
  - `GitConflictIncoming` / `GitConflictIncomingLabel` (blue) - incoming changes
  - `GitConflictAncestor` / `GitConflictAncestorLabel` (purple) - common ancestor

- **IndentBlankline v3 rainbow colors** (#191)
  - `RainbowRed`, `RainbowYellow`, `RainbowBlue`, `RainbowOrange`
  - `RainbowGreen`, `RainbowViolet`, `RainbowCyan`
  - Enhanced `IblScope` visibility (grey → purple)

- **TreeSitter modern captures** (#217) - 30+ new captures:
  - Comment types: `@comment.documentation`, `@comment.error`, `@comment.note`, `@comment.warning`
  - Function calls: `@function.call`, `@function.method.call`
  - Keywords: `@keyword.return`, `@keyword.type`, `@keyword.modifier`, `@keyword.conditional.ternary`, `@keyword.coroutine`, `@keyword.debug`
  - Markup: `@markup.list.checked`, `@markup.list.unchecked`, `@markup.quote`, `@markup.link.label`, `@markup.raw.block`
  - Strings: `@string.documentation`, `@string.special.path`, `@string.special.url`
  - Types: `@type.definition`, `@module.builtin`
  - Variables: `@variable.parameter.builtin`
  - And more! See full list in highlights.lua

#### Plugin Support

- **dropbar.nvim** (#249)
  - `WinBar`, `WinBarNC` - standard winbar
  - `DropBarIconKind`, `DropBarKind`, `DropBarSeparator`, etc.
  - LSP kind integration

### 🐛 Fixed

- **Neovim 0.11 lualine transparency** (#243)
  - StatusLine groups now explicitly set `fmt = "NONE"` to prevent unwanted reverse attribute
  - Fixes broken transparency in lualine on Neovim 0.11+

- **MatchParen visibility in comments** (#230)
  - Changed background from `grey` to `bg3` for better visibility
  - Parentheses now clearly visible when highlighted in commented code

- **EndOfBuffer tildes visibility** (#223)
  - Changed foreground from `bg2` to `grey`
  - Tildes now visible in dark mode when `ending_tildes = true`

- **Lualine inactive window distinction** (#237)
  - Inactive sections a/b now use `bg1` instead of `bg0`
  - Better visual separation between statusline and buffer

### 🧪 Testing

- **Comprehensive test suite added**
  - 13 automated tests covering all Phase 1 fixes
  - Manual test files for visual verification (Markdown, Lua, Git conflicts)
  - Test runner script: `./tests/run-tests.sh`
  - CI/CD ready with headless testing support
  - See `tests/README.md` for full documentation

### 📚 Documentation

- Updated README with Neovim 0.9+ requirement
- Added link to v0.1.0 for legacy Neovim support
- Created CHANGELOG.md (this file)
- Comprehensive test suite documentation

### 🔧 Internal

- Better code organization in TreeSitter highlights
- Grouped highlights by category (Attributes, Comments, Functions, etc.)
- Added references to nvim-treesitter standards
- Improved maintainability

---

## [v0.1.0] - 2025-11-08

Last version supporting Neovim 0.5-0.8.

### Features

- 7 theme styles (dark, darker, cool, deep, warm, warmer, light)
- TreeSitter support (Neovim 0.8+)
- LSP semantic tokens (Neovim 0.9+)
- 24+ plugin integrations
- Customizable colors and highlights
- Lualine theme integration
- Toggle between styles with keybinding

For users on Neovim 0.5-0.8, pin to this version:

```lua
-- Using Lazy
{ "navarasu/onedark.nvim", version = "v0.1.0" }

-- Using Packer
use { "navarasu/onedark.nvim", tag = "v0.1.0" }
```

---

## Upgrade Guide

### From v0.1.0 to Latest

If you're upgrading to the latest version:

**1. Check Neovim version:**
```bash
nvim --version  # Must be 0.9.0 or higher
```

**2. Update TreeSitter highlights (if you customize):**
- Replace `@markup.emphasis` with `@markup.italic`
- Replace `@markup.strike` with `@markup.strikethrough`
- Replace `@text.*` with `@markup.*` equivalents

**3. Benefit from new features:**
- DiagnosticUnnecessary now highlights unused code
- Git conflict markers have colored backgrounds
- IndentBlankline v3 rainbow scope colors
- Better MatchParen visibility in comments
- Lualine improvements in Neovim 0.11+

**No config changes required** - all changes are backward compatible for setup options!

---

## Links

- [Repository](https://github.com/navarasu/onedark.nvim)
- [Issues](https://github.com/navarasu/onedark.nvim/issues)
- [Pull Requests](https://github.com/navarasu/onedark.nvim/pulls)
