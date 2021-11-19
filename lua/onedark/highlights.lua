local c = require('onedark.colors')
local cfg = require('onedark.config')

local M = {}
local hl = {langs = {}, plugins = {}}

local function gui(group_settings)
    if group_settings.bold then return "bold"
    elseif group_settings.underline then return "underline"
    elseif group_settings.undercurl then return "undercurl"
    elseif group_settings.italic then return "italic"
    elseif group_settings.reverse then return "reverse"
    else return "NONE" end
end

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        local fg = group_settings.fg and "guifg=" .. group_settings.fg or "guifg=NONE"
        local bg = group_settings.bg and "guibg=" .. group_settings.bg or "guibg=NONE"
        local sp = group_settings.sp and "guisp=" .. group_settings.sp or "guisp=NONE"
        vim.cmd("highlight " .. group_name .. " ".."gui="..gui(group_settings).." "..fg .. " " .. bg .. " " .. sp)
    end
end


local colors = {
    Fg = {fg = c.fg},
    LightGrey = {fg = c.light_grey},
    Grey = {fg = c.grey},
    Red = {fg = c.red},
    Cyan = {fg = c.cyan},
    Yellow = {fg = c.yellow},
    Orange = {fg = c.orange},
    Green = {fg = c.green},
    Blue = {fg = c.blue},
    Purple = {fg = c.purple}
}
hl.common = {
    Normal = {fg = c.fg, bg = cfg.bg and c.none or c.bg0},
    Terminal = {fg = c.fg, bg = cfg.bg and c.none or c.bg0},
    EndOfBuffer = {fg = cfg.hide_ending_tildes and (cfg.bg and c.none or c.bg0) or c.bg2, bg = cfg.bg and c.none or c.bg0},
    FoldColumn = {fg = c.fg, bg = cfg.bg and c.none or c.bg1},
    Folded = {fg = c.fg, bg = cfg.bg and c.none or c.bg1},
    SignColumn = {fg = c.fg, bg = cfg.bg and c.none or c.bg0},
    ToolbarLine = {fg = c.fg},
    Cursor = {reverse = true},
    vCursor = {reverse = true},
    iCursor = {reverse = true},
    lCursor = {reverse = true},
    CursorIM = {reverse = true},
    CursorColumn = {bg = c.bg1},
    CursorLine = {bg = c.bg1},
    ColorColumn = {bg = c.bg1},
    CursorLineNr = {fg = c.fg},
    LineNr = {fg = c.grey},
    Conceal = {fg = c.grey, bg = c.bg1},
    DiffAdd = {fg = c.none, bg = c.diff_add},
    DiffChange = {fg = c.none, bg = c.diff_change},
    DiffDelete = {fg = c.none, bg = c.diff_delete},
    DiffText = {fg = c.none, bg= c.diff_text},
    DiffAdded = colors.Green,
    DiffRemoved = colors.Red,
    DiffFile = colors.Cyan,
    DiffIndexLine = colors.Grey,
    Directory = {fg = c.blue},
    ErrorMsg = {fg = c.red, bold = true, underline = true},
    WarningMsg = {fg = c.yellow, bold = true},
    MoreMsg = {fg = c.blue, bold = true},
    IncSearch = {fg = c.bg0, bg = c.orange},
    Search = {fg = c.bg0, bg = c.bg_yellow},
    MatchParen = {fg = c.none, bg = c.grey},
    NonText = {fg = c.grey},
    Whitespace = {fg = c.grey},
    SpecialKey = {fg = c.grey},
    Pmenu = {fg = c.fg, bg = c.bg1},
    PmenuSbar = {fg = c.none, bg = c.bg1},
    PmenuSel = {fg = c.bg0, bg = c.bg_blue},
    WildMenu = {fg = c.bg0, bg = c.blue},
    PmenuThumb = {fg = c.none, bg = c.grey},
    Question = {fg = c.yellow},
    SpellBad = {fg = c.red, underline = true, sp = c.red},
    SpellCap = {fg = c.yellow, underline = true, sp = c.yellow},
    SpellLocal = {fg = c.blue, underline = true, sp = c.blue},
    SpellRare = {fg = c.purple, underline = true, sp = c.purple},
    StatusLine = {fg = c.fg, bg = c.bg2},
    StatusLineTerm = {fg = c.fg, bg = c.bg2},
    StatusLineNC = {fg = c.grey, bg = c.bg1},
    StatusLineTermNC = {fg = c.grey, bg = c.bg1},
    TabLine = {fg = c.fg, bg = c.bg1},
    TabLineFill = {fg = c.grey, bg = c.bg1},
    TabLineSel =  {fg = c.bg0, bg = c.fg},
    VertSplit = {fg = c.bg1},
    Visual = {bg = c.bg3},
    VisualNOS = {fg = c.none, bg = c.bg2, underline = true},
    QuickFixLine = {fg = c.blue, underline = true},
    Debug = {fg = c.yellow},
    debugPC = {fg = c.bg0, bg = c.green},
    debugBreakpoint = {fg = c.bg0, bg = c.red},
    ToolbarButton = {fg = c.bg0, bg = c.bg_blue}
}

hl.syntax = {
    String = colors.Green,
    Character = colors.Orange,
    Number = colors.Orange,
    Float = colors.Orange,
    Boolean = colors.Orange,
    Type = colors.Yellow,
    Structure = colors.Yellow,
    StorageClass = colors.Yellow,
    Identifier = colors.Red,
    Constant = colors.Cyan,
    PreProc = colors.Purple,
    PreCondit = colors.Purple,
    Include = colors.Purple,
    Keyword = colors.Purple,
    Define = colors.Purple,
    Typedef = colors.Purple,
    Exception = colors.Purple,
    Conditional = colors.Purple,
    Repeat = colors.Purple,
    Statement = colors.Purple,
    Macro = colors.Red,
    Error = colors.Purple,
    Label = colors.Purple,
    Special = colors.Red,
    SpecialChar = colors.Red,
    Function = colors.Blue,
    Operator = colors.Red,
    Title = colors.Cyan,
    Tag = colors.Green,
    Delimiter = colors.LightGrey,
    Comment = {fg = c.grey, italic = cfg.italic_comment},
    SpecialComment = {fg = c.grey, italic = cfg.italic_comment},
    Todo = {fg = c.red, italic = cfg.italic_comment}
}

hl.treesitter = {
    TSAnnotation = colors.Fg,
    TSAttribute = colors.Cyan,
    TSBoolean = colors.Orange,
    TSCharacter = colors.Orange,
    TSComment = {fg = c.grey, italic = cfg.italic_comment},
    TSConditional = colors.Purple,
    TSConstant = colors.Orange,
    TSConstBuiltin = colors.Orange,
    TSConstMacro = colors.Orange,
    TSConstructor = {fg = c.yellow, bold = true},
    TSError = colors.Fg,
    TSException = colors.Purple,
    TSField = colors.Cyan,
    TSFloat = colors.Orange,
    TSFunction = colors.Blue,
    TSFuncBuiltin = colors.Cyan,
    TSFuncMacro = colors.Cyan,
    TSInclude = colors.Purple,
    TSKeyword = colors.Purple,
    TSKeywordFunction = {fg = c.purple, bold = true},
    TSKeywordOperator = colors.Purple,
    TSLabel = colors.Red,
    TSMethod = colors.Blue,
    TSNamespace = colors.Yellow,
    TSNone = colors.Fg,
    TSNumber = colors.Orange,
    TSOperator = colors.Purple,
    TSParameter = colors.Red,
    TSParameterReference = colors.Fg,
    TSProperty = colors.Cyan,
    TSPunctDelimiter = colors.LightGrey,
    TSPunctBracket = colors.LightGrey,
    TSPunctSpecial = colors.LightGrey,
    TSRepeat = colors.Purple,
    TSString = colors.Green,
    TSStringRegex = colors.Orange,
    TSStringEscape = colors.Red,
    TSSymbol = colors.Cyan,
    TSTag = colors.Red,
    TSTagDelimiter = colors.Red,
    TSText = colors.Fg,
    TSStrong = colors.Fg,
    TSEmphasis = colors.Fg,
    TSUnderline = colors.Fg,
    TSStrike = colors.Fg,
    TSTitle = colors.Fg,
    TSLiteral = colors.Green,
    TSURI = colors.Fg,
    TSMath = colors.Fg,
    TSTextReference = colors.Fg,
    TSEnviroment = colors.Fg,
    TSEnviromentName = colors.Fg,
    TSNote = colors.Fg,
    TSWarning = colors.Fg,
    TSDanger = colors.Fg,
    TSType = colors.Yellow,
    TSTypeBuiltin = colors.Orange,
    TSVariable = colors.Fg,
    TSVariableBuiltin = colors.Red
}

hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = colors.Orange,
    LspCxxHlGroupMemberVariable = colors.Orange,
    LspCxxHlGroupNamespace = colors.Blue,
    LspCxxHlSkippedRegion = colors.Grey,
    LspCxxHlSkippedRegionBeginEnd = colors.Red,
    DiagnosticError = {fg = cfg.darker_diagnostics and c.dark_red or c.red},
    DiagnosticHint = {fg = cfg.darker_diagnostics and c.dark_purple or c.purple},
    DiagnosticInfo = {fg = cfg.darker_diagnostics and c.dark_cyan or c.cyan},
    DiagnosticWarn = {fg = cfg.darker_diagnostics and c.dark_yellow or c.yellow},
    DiagnosticUnderlineError = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.red},
    DiagnosticUnderlineHint = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.purple},
    DiagnosticUnderlineInfo = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.blue},
    DiagnosticUnderlineWarn = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.yellow},
    LspReferenceText = {underline = true },
    LspReferenceWrite = {underline = true },
    LspReferenceRead = {underline = true }
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn

hl.plugins.cmp = {
    CmpItemAbbr = colors.Fg,
    CmpItemAbbrDeprecated = colors.Fg,
    CmpItemAbbrMatch = colors.Cyan,
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, underline = true },
    CmpItemKind = colors.Purple,
    CmpItemMenu = colors.LightGrey,
}

hl.plugins.whichkey = {
    WhichKey = colors.Red,
    WhichKeyDesc = colors.Blue,
    WhichKeyGroup = colors.Orange,
    WhichKeySeperator = colors.Green
}

hl.plugins.gitgutter = {
    GitGutterAdd = {fg = c.green},
    GitGutterChange = {fg = c.blue},
    GitGutterDelete = {fg = c.red},
}

hl.plugins.hop = {
    HopNextKey = {fg = c.bg0, bg = c.orange},
    HopNextKey1 = {fg = c.bg0, bg = c.orange},
    HopNextKey2 = {fg = c.bg0, bg = c.bg_yellow},
    HopUnmatched = {fg = c.fg, bg = c.bg1},
}

hl.plugins.diffview = {
    DiffviewFilePanelTitle = {fg = c.blue, bold = true},
    DiffviewFilePanelCounter = {fg = c.purple, bold = true},
    DiffviewFilePanelFileName = colors.Fg,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = colors.Grey,
    DiffviewFilePanelPath = colors.Grey,
    DiffviewFilePanelInsertions = colors.Green,
    DiffviewFilePanelDeletions = colors.Red,
    DiffviewStatusAdded = colors.Green,
    DiffviewStatusUntracked = colors.Blue,
    DiffviewStatusModified = colors.Blue,
    DiffviewStatusRenamed = colors.Blue,
    DiffviewStatusCopied = colors.Blue,
    DiffviewStatusTypeChange = colors.Blue,
    DiffviewStatusUnmerged = colors.Blue,
    DiffviewStatusUnknown = colors.Red,
    DiffviewStatusDeleted = colors.Red,
    DiffviewStatusBroken = colors.Red
}

hl.plugins.gitsigns = {
    GitSignsAdd = colors.Green,
    GitSignsAddLn = colors.Green,
    GitSignsAddNr = colors.Green,
    GitSignsChange = colors.Blue,
    GitSignsChangeLn = colors.Blue,
    GitSignsChangeNr = colors.Blue,
    GitSignsDelete = colors.Red,
    GitSignsDeleteLn = colors.Red,
    GitSignsDeleteNr = colors.Red
}

hl.plugins.nvim_tree = {
    NvimTreeNormal = { fg = c.fg, bg = c.bg_d },
    NvimTreeVertSplit = { fg = c.bg_d, bg = c.bg_d },
    NvimTreeEndOfBuffer = { fg = cfg.hide_ending_tildes and c.bg_d or c.bg2, bg = c.bg_d },
    NvimTreeRootFolder = { fg = c.orange, bold = true },
    NvimTreeGitDirty = colors.Yellow,
    NvimTreeGitNew = colors.Green,
    NvimTreeGitDeleted = colors.Red,
    NvimTreeSpecialFile = { fg = c.yellow, underline=true },
    NvimTreeIndentMarker = colors.Fg,
    NvimTreeImageFile = { fg = c.dark_purple },
    NvimTreeSymlink = colors.Purple,
    NvimTreeFolderName = colors.Blue,
}
hl.plugins.telescope = {
    TelescopeBorder = colors.Green,
    TelescopePromptBorder = colors.Green,
    TelescopeResultsBorder = colors.Purple,
    TelescopePreviewBorder = colors.Cyan,
    TelescopeMatching = { fg = c.yellow, bold = true },
    TelescopePromptPrefix = colors.Blue,
    TelescopeSelection =  { bg =c.bg2 },
    TelescopeSelectionCaret = colors.Blue
}

hl.plugins.dashboard = {
    DashboardShortCut = colors.Yellow,
    DashboardHeader = colors.Green,
    DashboardCenter = colors.Blue,
    DashboardFooter = { fg = c.cyan, italic = true}
}

hl.plugins.symbols_outline = {
    FocusedSymbol = { fg = c.bg1, bg = c.yellow, bold = true },
}

hl.plugins.ts_rainbow = {
    rainbowcol1 = colors.Grey,
    rainbowcol2 = colors.Yellow,
    rainbowcol3 = colors.Blue,
    rainbowcol4 = colors.Orange,
    rainbowcol5 = colors.Purple,
    rainbowcol6 = colors.Green,
    rainbowcol7 = colors.Red
}

hl.langs.c = {
    cInclude = colors.Blue,
    cStorageClass = colors.Purple,
    cTypedef = colors.Purple,
    cDefine = colors.Cyan,
    cTSInclude = colors.Blue,
    cTSConstant = colors.Cyan,
    cTSConstMacro = colors.Purple,
}

hl.langs.cpp = {
    cppStatement = { fg = c.purple, bold = true },
    cppTSInclude = colors.Blue,
    cppTSConstant = colors.Cyan,
    cppTSConstMacro = colors.Purple,
}

hl.langs.markdown = {
    markdownBlockquote = colors.Grey,
    markdownBold = {fg = c.none, bold = true},
    markdownBoldDelimiter = colors.Grey,
    markdownCode = colors.Green,
    markdownCodeBlock = colors.Green,
    markdownCodeDelimiter = colors.Yellow,
    markdownH1 = {fg = c.red, bold = true},
    markdownH2 = {fg = c.purple, bold = true},
    markdownH3 = {fg = c.orange, bold = true},
    markdownH4 = {fg = c.red, bold = true},
    markdownH5 = {fg = c.purple, bold = true},
    markdownH6 = {fg = c.orange, bold = true},
    markdownHeadingDelimiter = colors.Grey,
    markdownHeadingRule = colors.Grey,
    markdownId = colors.Yellow,
    markdownIdDeclaration = colors.Red,
    markdownItalic = {fg = c.none, italic = true},
    markdownItalicDelimiter = {fg = c.grey, italic = true},
    markdownLinkDelimiter = colors.Grey,
    markdownLinkText = colors.Red,
    markdownLinkTextDelimiter = colors.Grey,
    markdownListMarker = colors.Red,
    markdownOrderedListMarker = colors.Red,
    markdownRule = colors.Purple,
    markdownUrl = {fg = c.blue, underline = true},
    markdownUrlDelimiter = colors.Grey,
    markdownUrlTitleDelimiter = colors.Green
}

hl.langs.php = {
    phpFunctions = colors.Fg,
    phpMethods = colors.Cyan,
    phpStructure = colors.Purple,
    phpOperator = colors.Purple,
    phpMemberSelector = colors.Fg,
    phpVarSelector = colors.Orange,
    phpIdentifier = colors.Orange,
    phpBoolean = colors.Cyan,
    phpNumber = colors.Orange,
    phpHereDoc = colors.Green,
    phpNowDoc = colors.Green,
    phpSCKeyword = colors.Purple,
    phpFCKeyword = colors.Purple,
    phpRegion = colors.Blue
}

hl.langs.scala = {
    scalaNameDefinition = colors.Fg,
    scalaInterpolationBoundary = colors.Purple,
    scalaInterpolation = colors.Purple,
    scalaTypeOperator = colors.Red,
    scalaOperator = colors.Red,
    scalaKeywordModifier = colors.Red
}

hl.langs.tex = {
    latexTSInclude = colors.Blue,
    latexTSFuncMacro = colors.Purple,
    latexTSEnvironment = { fg = c.cyan, bold = true },
    latexTSEnvironmentName = colors.Yellow,
    texCmdEnv = colors.Cyan,
    texEnvArgName = colors.Yellow,
    latexTSTitle = colors.Green,
    latexTSType = colors.Blue,
    latexTSMath   = colors.Orange,
    texMathZoneX  = colors.Orange,
    texMathZoneXX = colors.Orange,
    texMathDelimZone = colors.LightGrey,
    texMathDelim = colors.Purple,
    texMathOper = colors.Red,
    texCmd = colors.Purple,
    texCmdPart = colors.Blue,
    texCmdPackage = colors.Blue,
    texPgfType = colors.Yellow,
}

hl.langs.vim = {
    vimTSFuncMacro = {fg = c.cyan, bold = true},
    vimCommentTitle = {fg = c.light_grey, bold = true},
    vimCommand =  {fg = c.cyan, bold = true},
    vimLet = colors.Purple,
    vimFunction = colors.Blue,
    vimIsCommand = colors.Fg,
    vimUserFunc = colors.Blue,
    vimFuncName = colors.Blue,
    vimMap = colors.Purple,
    vimMapModKey = colors.Orange,
    vimNotation = colors.Red,
    vimMapLhs = colors.Blue,
    vimMapRhs = colors.Blue,
    vimOption = colors.Red,
    vimUserAttrbKey = colors.Red,
    vimUserAttrb = colors.Blue,
    vimSynType = colors.Cyan,
    vimHiBang = colors.Purple,
    vimSet = colors.Yellow,
    vimSetEqual = colors.Yellow,
    vimSetSep = colors.LightGrey,
    vimVar = colors.Fg,
    vimFuncVar = colors.Fg,
    vimContinue = colors.Grey,
    vimAutoCmdSfxList = colors.Cyan,
}

function M.setup()
    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    for _, group in pairs(hl.langs) do vim_highlights(group) end
    for _, group in pairs(hl.plugins) do vim_highlights(group) end
end

return M

