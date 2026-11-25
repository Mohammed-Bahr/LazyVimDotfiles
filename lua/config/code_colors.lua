-- Gruvbox-flavoured syntax colours for code, layered on top of the UI theme.
--
-- Only foreground colours of code groups are replaced. Backgrounds, floats,
-- borders, statusline, tabline, pickers, git signs and diagnostics all keep
-- whatever the active colour scheme gives them, so the overall theme does not
-- change -- just the colours of the text you read while coding.
--
-- Scoped to the notiondark colour scheme on purpose: switching to another
-- scheme (e.g. `:colorscheme kanagawa`) leaves that scheme untouched.

local gb = {
  fg1 = "#ebdbb2", -- warm off-white, gruvbox's default text
  fg2 = "#d5c4a1",
  gray = "#928374", -- comments
  red = "#fb4934",
  green = "#b8bb26",
  yellow = "#fabd2f",
  blue = "#83a598",
  purple = "#d3869b",
  aqua = "#8ec07c",
  orange = "#fe8019",
}

-- Colours below mirror gruvbox's own syntax mapping (gruvbox.nvim), so the
-- code reads like gruvbox while everything around it stays NotionDark.
local code = {
  -- Legacy syntax groups
  Comment = { fg = gb.gray, italic = true },
  Constant = { fg = gb.purple },
  String = { fg = gb.green },
  Character = { fg = gb.purple },
  Number = { fg = gb.purple },
  Boolean = { fg = gb.purple },
  Float = { fg = gb.purple },
  Identifier = { fg = gb.blue },
  Function = { fg = gb.green },
  Statement = { fg = gb.red },
  Conditional = { fg = gb.red },
  Repeat = { fg = gb.red },
  Label = { fg = gb.red },
  Keyword = { fg = gb.red },
  Exception = { fg = gb.red },
  Operator = { fg = gb.orange },
  PreProc = { fg = gb.aqua },
  Include = { fg = gb.aqua },
  Define = { fg = gb.aqua },
  Macro = { fg = gb.aqua },
  PreCondit = { fg = gb.aqua },
  Type = { fg = gb.yellow },
  Typedef = { fg = gb.yellow },
  StorageClass = { fg = gb.orange },
  Structure = { fg = gb.aqua },
  Special = { fg = gb.orange },
  SpecialChar = { fg = gb.orange },
  Tag = { fg = gb.aqua },
  Delimiter = { fg = gb.orange },
  SpecialComment = { fg = gb.gray, italic = true },
  Debug = { fg = gb.orange },
  Underlined = { fg = gb.blue, underline = true },
  Error = { fg = gb.red },
  Todo = { fg = gb.orange, bold = true },

  -- Treesitter: variables
  ["@variable"] = { fg = gb.fg1 },
  ["@variable.builtin"] = { fg = gb.orange, italic = true },
  ["@variable.parameter"] = { fg = gb.blue },
  ["@variable.member"] = { fg = gb.blue },
  ["@constant"] = { fg = gb.purple },
  ["@constant.builtin"] = { fg = gb.purple },
  ["@constant.macro"] = { fg = gb.aqua },

  -- Treesitter: literals
  ["@string"] = { fg = gb.green },
  ["@string.documentation"] = { fg = gb.fg2, italic = true },
  ["@string.regexp"] = { fg = gb.green },
  ["@string.escape"] = { fg = gb.orange },
  ["@string.special"] = { fg = gb.orange },
  ["@character"] = { fg = gb.purple },
  ["@character.special"] = { fg = gb.orange },
  ["@number"] = { fg = gb.purple },
  ["@number.float"] = { fg = gb.purple },
  ["@boolean"] = { fg = gb.purple },

  -- Treesitter: functions
  ["@function"] = { fg = gb.green },
  ["@function.call"] = { fg = gb.green },
  ["@function.method"] = { fg = gb.green },
  ["@function.builtin"] = { fg = gb.orange },
  ["@function.macro"] = { fg = gb.aqua },
  ["@constructor"] = { fg = gb.orange },

  -- Treesitter: keywords and operators
  ["@operator"] = { fg = gb.orange },
  ["@keyword"] = { fg = gb.red },
  ["@keyword.function"] = { fg = gb.red },
  ["@keyword.operator"] = { fg = gb.red },
  ["@keyword.return"] = { fg = gb.red },
  ["@keyword.conditional"] = { fg = gb.red },
  ["@keyword.repeat"] = { fg = gb.red },
  ["@keyword.exception"] = { fg = gb.red },
  ["@keyword.import"] = { fg = gb.aqua },
  ["@keyword.storage"] = { fg = gb.orange },

  -- Treesitter: types and members
  ["@type"] = { fg = gb.yellow },
  ["@type.builtin"] = { fg = gb.yellow },
  ["@type.definition"] = { fg = gb.yellow },
  ["@property"] = { fg = gb.blue },
  ["@field"] = { fg = gb.blue },
  ["@parameter"] = { fg = gb.blue },
  ["@namespace"] = { fg = gb.fg1 },
  ["@module"] = { fg = gb.fg1 },

  -- Treesitter: punctuation
  ["@punctuation"] = { fg = gb.orange },
  ["@punctuation.delimiter"] = { fg = gb.orange },
  ["@punctuation.bracket"] = { fg = gb.orange },
  ["@punctuation.special"] = { fg = gb.orange },

  -- Treesitter: comments and tags
  ["@comment"] = { fg = gb.gray, italic = true },
  ["@comment.todo"] = { fg = gb.orange, bold = true },
  ["@comment.note"] = { fg = gb.aqua },
  ["@comment.warning"] = { fg = gb.yellow },
  ["@comment.error"] = { fg = gb.red },
  ["@tag"] = { fg = gb.aqua },
  ["@tag.attribute"] = { fg = gb.blue },
  ["@tag.delimiter"] = { fg = gb.orange },

  -- Treesitter: markup
  ["@markup"] = { fg = gb.fg1 },
  ["@markup.heading"] = { fg = gb.green, bold = true },
  ["@markup.heading.1"] = { fg = gb.green, bold = true },
  ["@markup.heading.2"] = { fg = gb.green, bold = true },
  ["@markup.heading.3"] = { fg = gb.fg2, bold = true },
  ["@markup.heading.4"] = { fg = gb.fg2, bold = true },
  ["@markup.heading.5"] = { fg = gb.fg2, bold = true },
  ["@markup.heading.6"] = { fg = gb.fg2, bold = true },
  ["@markup.raw"] = { fg = gb.green },
  ["@markup.raw.block"] = { fg = gb.fg1 },
  ["@markup.link"] = { fg = gb.blue, underline = true },
  ["@markup.link.url"] = { fg = gb.blue, underline = true },
  ["@markup.link.label"] = { fg = gb.orange },
  ["@markup.list"] = { fg = gb.orange },
  ["@markup.list.checked"] = { fg = gb.green },
  ["@markup.list.unchecked"] = { fg = gb.gray },
  ["@markup.strong"] = { bold = true },
  ["@markup.italic"] = { italic = true },
  ["@markup.quote"] = { fg = gb.fg2, italic = true },
}

local M = {}

function M.apply()
  for group, hl in pairs(code) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

-- Re-apply after every colourscheme load so these overrides always land on top
-- of the theme's own syntax definitions. The augroup is cleared first, which
-- makes this safe to run again when the file is hot-reloaded.
local augroup = vim.api.nvim_create_augroup("GruvboxCodeColors", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup,
  pattern = "notiondark",
  callback = M.apply,
})

-- Covers the case where notiondark is already active (e.g. this module is
-- re-required on save, after the colourscheme has loaded).
if vim.g.colors_name == "notiondark" then
  M.apply()
end

return M
