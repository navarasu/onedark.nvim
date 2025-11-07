-- Minimal init.lua for testing onedark.nvim locally
-- Usage: nvim -u tests/test-init.lua [file]
-- Example: nvim -u tests/test-init.lua tests/manual/test.md

-- Set up runtime path to use local version
local repo_root = vim.fn.fnamemodify(vim.fn.expand('<sfile>:p'), ':h:h')
vim.opt.rtp:prepend(repo_root)

-- Basic Neovim settings
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.list = true -- Show whitespace characters
vim.opt.fillchars = { eob = '~' } -- Show end-of-buffer tildes

-- Configure onedark with all features enabled
require('onedark').setup({
  style = 'dark', -- Change to test different styles: dark, darker, cool, deep, warm, warmer, light
  transparent = false,
  ending_tildes = true,

  -- Test code style options
  code_style = {
    comments = 'italic',
    keywords = 'bold',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },

  -- Test lualine transparency
  lualine = {
    transparent = false,
  },

  -- Test diagnostic options
  diagnostics = {
    darker = true,
    undercurl = true,
    background = true,
  },
})

-- Load the colorscheme
require('onedark').load()

-- Print confirmation
print("✓ onedark.nvim loaded from: " .. repo_root)
print("✓ Neovim version: " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch)

-- Helper commands for testing
vim.api.nvim_create_user_command('TestHighlights', function()
  vim.cmd('so $VIMRUNTIME/syntax/hitest.vim')
end, { desc = 'Show all highlight groups' })

vim.api.nvim_create_user_command('TestColors', function()
  local colors = require('onedark.colors')
  local buf = vim.api.nvim_create_buf(false, true)
  local lines = {}

  table.insert(lines, "OneDark Color Palette:")
  table.insert(lines, "")
  for name, color in pairs(colors) do
    table.insert(lines, string.format("%-20s %s", name, color))
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_win_set_buf(0, buf)
  vim.bo[buf].filetype = 'text'
end, { desc = 'Show color palette' })

vim.api.nvim_create_user_command('TestConfig', function()
  print(vim.inspect(vim.g.onedark_config))
end, { desc = 'Print current config' })

vim.api.nvim_create_user_command('TestToggleStyle', function()
  require('onedark').toggle()
end, { desc = 'Toggle between styles' })

vim.api.nvim_create_user_command('TestDiagnostics', function()
  -- Create fake diagnostics for testing
  local ns = vim.api.nvim_create_namespace('onedark_test')
  local bufnr = vim.api.nvim_get_current_buf()

  vim.diagnostic.set(ns, bufnr, {
    { lnum = 0, col = 0, message = "Error diagnostic", severity = vim.diagnostic.severity.ERROR },
    { lnum = 1, col = 0, message = "Warning diagnostic", severity = vim.diagnostic.severity.WARN },
    { lnum = 2, col = 0, message = "Info diagnostic", severity = vim.diagnostic.severity.INFO },
    { lnum = 3, col = 0, message = "Hint diagnostic", severity = vim.diagnostic.severity.HINT },
  })

  print("✓ Test diagnostics added to current buffer")
end, { desc = 'Add test diagnostics to current buffer' })

-- Enable TreeSitter if available
local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if ok then
  treesitter.setup({
    highlight = { enable = true },
  })
  print("✓ TreeSitter enabled")
else
  print("⚠ TreeSitter not available (install nvim-treesitter for full testing)")
end

-- Print available test commands
print("\n" .. string.rep("─", 60))
print("Test Commands:")
print("  :TestHighlights    - Show all highlight groups")
print("  :TestColors        - Show color palette")
print("  :TestConfig        - Print current config")
print("  :TestToggleStyle   - Toggle between theme styles")
print("  :TestDiagnostics   - Add test diagnostics to buffer")
print("  :Inspect           - Show highlight group under cursor (built-in)")
print("\nTest Files:")
print("  tests/manual/*.{md,lua,py,js} - Visual test files")
print(string.rep("─", 60) .. "\n")
