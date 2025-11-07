# Markdown Test File - onedark.nvim

This file tests TreeSitter markdown highlighting (fix #217).

## Headings Test

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

## Text Formatting

**Bold text** should be bold (@markup.strong)
*Italic text* should be italic (@markup.italic)
~~Strikethrough text~~ should have strikethrough (@markup.strikethrough)
__Underlined text__ should be underlined (@markup.underline)

## Lists

### Unordered Lists
- Item 1
- Item 2
  - Nested item
  - Another nested

### Ordered Lists
1. First item
2. Second item
3. Third item

### Task Lists (fix #217 - @markup.list.checked/unchecked)
- [ ] Unchecked task
- [x] Checked task
- [ ] Another unchecked

## Links and URLs

[Link text](https://example.com) - @markup.link and @markup.link.url
<https://example.com> - @string.special.url (fix #217)

## Code

Inline `code` should be highlighted (@markup.raw)

```lua
-- Code block (@markup.raw.block - fix #217)
local function test()
  print("Hello, World!")
end
```

```python
def hello():
    """Docstring"""
    print("Python code")
```

## Quotes

> This is a quote (@markup.quote - fix #217)
> Multiple lines
> Of quoted text

## Math (if supported)

Inline math: $E = mc^2$ (@markup.math)

## End of Buffer Test

Scroll to the bottom to see tildes (fix #223 - EndOfBuffer should be visible)





















---
End of file - check tildes below (~)
