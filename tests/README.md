# onedark.nvim Test Suite

Comprehensive testing for the onedark.nvim colorscheme.

## Quick Start

### Run All Tests

```bash
./tests/run-tests.sh
```

This runs automated tests first, then optionally opens manual test files.

### Run Automated Tests Only

```bash
./tests/run-tests.sh --automated
```

Or directly with Neovim:

```bash
nvim --headless -u tests/test-init.lua -c "luafile tests/automated/test_highlights.lua" -c "qa!"
```

### Run Manual Tests Only

```bash
./tests/run-tests.sh --manual
```

Or open test files individually:

```bash
nvim -u tests/test-init.lua tests/manual/test.md
```

## Test Structure

```
tests/
├── README.md                          # This file
├── run-tests.sh                       # Main test runner
├── test-init.lua                      # Minimal Neovim config for testing
├── automated/
│   └── test_highlights.lua            # Automated highlight group tests
└── manual/
    ├── test.md                        # Markdown syntax test
    ├── test.lua                       # Lua syntax test
    └── test-conflict.txt              # Git conflict markers test
```

## Automated Tests

Tests verify:

### Fix Verification
- **#243** - StatusLine groups defined (Neovim 0.11 transparency fix)
- **#225** - DiagnosticOk, DiagnosticUnnecessary, DiagnosticDeprecated exist
- **#191** - IndentBlankline v3 highlights (IblIndent, RainbowRed, etc.)
- **#217** - Modern TreeSitter captures (@markup.italic, @markup.strikethrough, etc.)
- **#230** - MatchParen has background property
- **#223** - EndOfBuffer is defined
- **#235** - Git conflict markers (GitConflictCurrent, GitConflictIncoming, etc.)
- **#249** - Dropbar highlights (WinBar, DropBarIconKind, etc.)

### Core Functionality
- Colorscheme loads without errors
- Essential highlight groups exist
- All major TreeSitter captures defined

## Manual Testing

Manual tests provide visual verification of:

### test.md - Markdown Features
- ✅ Heading levels 1-6 with colors
- ✅ **Bold**, *italic*, ~~strikethrough~~, __underline__ (@markup.* fixes from #217)
- ✅ Task lists with checkboxes (@markup.list.checked/unchecked)
- ✅ Links and URLs (@string.special.url)
- ✅ Code blocks (@markup.raw.block)
- ✅ Quotes (@markup.quote)
- ✅ EndOfBuffer tildes visibility (fix #223)

### test.lua - Code Syntax
- ✅ Comments (including TODO, NOTE, WARNING highlights)
- ✅ Functions, methods, and calls (@function.call, @function.method.call from #217)
- ✅ Keywords (including @keyword.return, @keyword.type from #217)
- ✅ Strings and escapes
- ✅ Variables and parameters
- ✅ MatchParen visibility in comments (fix #230)
- ✅ Diagnostic showcases (for testing DiagnosticUnnecessary, etc.)

### test-conflict.txt - Git Conflicts
- ✅ GitConflictCurrent (GREEN background) - HEAD/current changes
- ✅ GitConflictIncoming (BLUE background) - incoming changes
- ✅ GitConflictAncestor (PURPLE background) - common ancestor
- ✅ Bold conflict markers (fix #235)

## Test Commands (in Neovim)

When using `test-init.lua`, these commands are available:

```vim
:TestHighlights    " Show all highlight groups
:TestColors        " Display color palette
:TestConfig        " Print current config
:TestToggleStyle   " Toggle between theme styles
:TestDiagnostics   " Add test diagnostics to buffer
:Inspect           " Show highlight group under cursor (built-in)
```

## Testing Different Styles

Edit `tests/test-init.lua` and change the `style` option:

```lua
require('onedark').setup({
  style = 'dark',  -- Try: dark, darker, cool, deep, warm, warmer, light
  ...
})
```

Or use `:TestToggleStyle` to cycle through styles.

## Testing Checklist

When verifying changes:

### Visual Checks
- [ ] All 7 styles load without errors (dark, darker, cool, deep, warm, warmer, light)
- [ ] Markdown formatting renders correctly
- [ ] Code syntax is properly highlighted
- [ ] Diagnostic colors are visible and distinct
- [ ] Git conflict markers have colored backgrounds
- [ ] MatchParen is visible in comments
- [ ] EndOfBuffer tildes are visible
- [ ] Lualine inactive windows are distinguishable from buffer

### Automated Checks
- [ ] All automated tests pass
- [ ] No Lua errors on colorscheme load
- [ ] All documented highlight groups exist

### Plugin Integration (if available)
- [ ] TreeSitter highlights work
- [ ] LSP diagnostics display correctly
- [ ] IndentBlankline v3 renders guides
- [ ] Lualine theme applies
- [ ] Telescope colors look good
- [ ] nvim-cmp menu is styled
- [ ] Git conflict plugins work (if installed)

## Adding New Tests

### Adding Automated Tests

Edit `tests/automated/test_highlights.lua`:

```lua
if test("New feature description", function()
  assert_highlight_exists("NewHighlightGroup")
  assert_highlight_has_property("NewGroup", "fg")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end
```

### Adding Manual Tests

Create new files in `tests/manual/` for language-specific or feature-specific testing.

## CI/CD Integration

To integrate with CI/CD:

```yaml
# Example GitHub Actions
- name: Run onedark.nvim tests
  run: |
    ./tests/run-tests.sh --automated
```

## Troubleshooting

### Tests fail with "colorscheme not found"

Ensure you're running from the repository root:

```bash
cd /path/to/onedark.nvim
./tests/run-tests.sh
```

### TreeSitter highlights not working

Install nvim-treesitter:

```vim
:TSInstall lua markdown
```

### "nvim: command not found"

Ensure Neovim 0.9+ is installed and in your PATH.

## Requirements

- **Neovim 0.9+** (required for all modern features)
- **nvim-treesitter** (optional, for TreeSitter highlight testing)
- **Bash** (for run-tests.sh script)

## Contributing

When adding new features or fixes:

1. Add automated tests to verify the fix
2. Add manual test examples if visual verification is needed
3. Update this README with testing instructions
4. Ensure all tests pass before submitting PR

---

**Note:** These tests cover the changes from the modernization effort (Phase 1). As new features are added in subsequent phases, additional tests should be created.
