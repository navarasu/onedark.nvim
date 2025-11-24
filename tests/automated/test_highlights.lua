-- Automated tests for onedark.nvim highlight groups
-- Run with: nvim --headless -u tests/test-init.lua -c "luafile tests/automated/test_highlights.lua" -c "qa!"

local function test(name, fn)
  local ok, err = pcall(fn)
  if ok then
    print("✓ " .. name)
    return true
  else
    print("✗ " .. name .. ": " .. tostring(err))
    return false
  end
end

local function assert_highlight_exists(group)
  local hl = vim.api.nvim_get_hl(0, { name = group })
  assert(next(hl) ~= nil, "Highlight group '" .. group .. "' not defined")
end

local function assert_highlight_has_property(group, property)
  local hl = vim.api.nvim_get_hl(0, { name = group })
  assert(hl[property] ~= nil, "Highlight group '" .. group .. "' missing property '" .. property .. "'")
end

print("\n" .. string.rep("=", 60))
print("Running onedark.nvim automated tests")
print(string.rep("=", 60) .. "\n")

local tests_passed = 0
local tests_failed = 0

-- Test 1: Basic colorscheme loads
if test("Colorscheme loads without errors", function()
  require('onedark').load()
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Test 2: Fix #243 - StatusLine should have defined attributes
if test("StatusLine highlights defined (fix #243)", function()
  assert_highlight_exists("StatusLine")
  assert_highlight_exists("StatusLineNC")
  assert_highlight_exists("StatusLineTerm")
  assert_highlight_exists("StatusLineTermNC")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Test 3: Fix #225 - Missing diagnostic highlights
if test("DiagnosticUnnecessary exists (fix #225)", function()
  assert_highlight_exists("DiagnosticUnnecessary")
  assert_highlight_exists("DiagnosticVirtualTextUnnecessary")
  assert_highlight_exists("DiagnosticUnderlineUnnecessary")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

if test("DiagnosticOk exists (fix #225)", function()
  assert_highlight_exists("DiagnosticOk")
  assert_highlight_exists("DiagnosticVirtualTextOk")
  assert_highlight_exists("DiagnosticUnderlineOk")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

if test("DiagnosticDeprecated exists (fix #225)", function()
  assert_highlight_exists("DiagnosticDeprecated")
  assert_highlight_exists("DiagnosticVirtualTextDeprecated")
  assert_highlight_exists("DiagnosticUnderlineDeprecated")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Test 4: Fix #191 - IndentBlankline v3 support
if test("IndentBlankline v3 highlights exist (fix #191)", function()
  assert_highlight_exists("IblIndent")
  assert_highlight_exists("IblWhitespace")
  assert_highlight_exists("IblScope")
  assert_highlight_exists("RainbowRed")
  assert_highlight_exists("RainbowYellow")
  assert_highlight_exists("RainbowBlue")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Test 5: Fix #217 - Modern TreeSitter captures
if test("Modern TreeSitter @markup.italic exists (fix #217)", function()
  assert_highlight_exists("@markup.italic")
  assert_highlight_exists("@markup.strikethrough")
  -- Old names should still work for compatibility
  assert_highlight_exists("@markup.strong")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

if test("New TreeSitter captures exist (fix #217)", function()
  assert_highlight_exists("@comment.documentation")
  assert_highlight_exists("@comment.error")
  assert_highlight_exists("@function.call")
  assert_highlight_exists("@keyword.return")
  assert_highlight_exists("@markup.list.checked")
  assert_highlight_exists("@string.special.url")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Test 6: Fix #230 - MatchParen visibility
if test("MatchParen has background (fix #230)", function()
  assert_highlight_exists("MatchParen")
  assert_highlight_has_property("MatchParen", "bg")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Test 7: Fix #223 - EndOfBuffer visibility
if test("EndOfBuffer is defined (fix #223)", function()
  assert_highlight_exists("EndOfBuffer")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Test 8: Fix #235 - Git conflict markers
if test("Git conflict highlights exist (fix #235)", function()
  assert_highlight_exists("GitConflictCurrent")
  assert_highlight_exists("GitConflictCurrentLabel")
  assert_highlight_exists("GitConflictIncoming")
  assert_highlight_exists("GitConflictIncomingLabel")
  assert_highlight_exists("GitConflictAncestor")
  assert_highlight_exists("GitConflictAncestorLabel")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Test 9: dropbar.nvim support (PR #249)
if test("Dropbar highlights exist (PR #249)", function()
  assert_highlight_exists("WinBar")
  assert_highlight_exists("WinBarNC")
  assert_highlight_exists("DropBarIconKind")
  assert_highlight_exists("DropBarSeparator")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Test 10: Core highlight groups
if test("Core highlight groups exist", function()
  assert_highlight_exists("Normal")
  assert_highlight_exists("Comment")
  assert_highlight_exists("Keyword")
  assert_highlight_exists("Function")
  assert_highlight_exists("String")
  assert_highlight_exists("Visual")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Test 11: Fix #254 - Tag highlights for JSX/TSX/HTML
if test("Tag highlights exist (fix #254)", function()
  assert_highlight_exists("@tag")
  assert_highlight_exists("@tag.builtin")
  assert_highlight_exists("@tag.attribute")
  assert_highlight_exists("@tag.delimiter")
end) then
  tests_passed = tests_passed + 1
else
  tests_failed = tests_failed + 1
end

-- Summary
print("\n" .. string.rep("=", 60))
print(string.format("Test Results: %d passed, %d failed", tests_passed, tests_failed))
print(string.rep("=", 60) .. "\n")

if tests_failed > 0 then
  os.exit(1)
else
  print("✓ All tests passed!")
  os.exit(0)
end
