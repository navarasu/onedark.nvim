-- Lua Test File - onedark.nvim
-- Tests TreeSitter highlighting and diagnostic features

-- Comments (@comment)
-- TODO: This should be highlighted (@comment.todo - fix #217)
-- NOTE: This is a note (@comment.note - fix #217)
-- WARNING: This is a warning (@comment.warning - fix #217)

--- Documentation comment (@comment.documentation - fix #217)
--- @param name string
--- @return boolean

-- Test MatchParen visibility (fix #230)
-- Try placing cursor on these parentheses in comments: ()
-- They should be visible when highlighted!

-- Variables (@variable)
local my_variable = "test"
local another_var = 123

-- Constants (@constant)
local MY_CONSTANT = "CONSTANT"
local ANOTHER_CONST = 42

-- Built-in variables (@variable.builtin - fix #217)
local result = _VERSION
local self_ref = self

-- Functions (@function)
local function my_function(param1, param2)
  -- Parameters (@variable.parameter)
  return param1 + param2
end

-- Function calls (@function.call - fix #217)
my_function(1, 2)
print("Hello")

-- Method calls (@function.method.call - fix #217)
local obj = {}
function obj:method()
  return self
end
obj:method()

-- Keywords (@keyword)
if true then
  print("conditional")  -- @keyword.conditional
elseif false then
  print("conditional ternary")  -- @keyword.conditional.ternary (fix #217)
else
  print("else")
end

-- Loops (@keyword.repeat)
for i = 1, 10 do
  print(i)
end

while true do
  break  -- @keyword.return (fix #217)
end

-- Return keyword (@keyword.return - fix #217)
local function test_return()
  return true
end

-- Operators (@operator)
local sum = 1 + 2 - 3 * 4 / 5
local comparison = sum == 10 and sum ~= 20 or sum > 5

-- Strings (@string)
local str1 = "double quotes"
local str2 = 'single quotes'
local str3 = [[multi-line
string]]

-- String escape (@string.escape)
local escaped = "line1\nline2\ttab"

-- String patterns (@string.regexp)
local pattern = "%d+"

-- Types (@type)
---@type table
local my_table = {}

---@type number
local my_number = 42

-- Boolean (@boolean)
local bool_true = true
local bool_false = false

-- Numbers (@number, @number.float)
local integer = 42
local float = 3.14
local scientific = 1.5e-10

-- Tables and properties
local person = {
  name = "John",      -- @property
  age = 30,          -- @property
  ["key-with-dash"] = "value"
}

-- Punctuation (@punctuation.bracket, @punctuation.delimiter)
local array = {1, 2, 3, 4, 5}
local nested = {{1, 2}, {3, 4}}

-- Special punctuation (@punctuation.special)
local vararg_func = function(...)
  local args = {...}
  return args
end

-- Module (@module)
local module = require('onedark')

-- Constructors (@constructor)
local mt = {}
function mt:new()
  local obj = setmetatable({}, self)
  return obj
end

-- Labels (@label)
::continue::
goto continue

-- Error showcase (for diagnostic testing)
-- Uncomment to test diagnostics (fix #225):
-- local undefined_var = some_undefined_function()  -- Should show DiagnosticError
-- local unused_variable = "unused"  -- Should show DiagnosticUnnecessary (fix #225)

-- Deprecated function example (for testing DiagnosticDeprecated - fix #225)
-- deprecated_function()  -- Should show strikethrough if marked deprecated

--[[
  Multi-line comment block
  Testing various comment styles
  Parentheses test: () [] {} should be visible (fix #230)
]]

return {
  test = "complete",
  features = {"comments", "strings", "functions", "keywords"}
}
