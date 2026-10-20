-- vim: set ft=lua :
-- NotionDark color palette — Zed-inspired restrained dark

local M = {}

M.name = "notiondark"
M.style = "dark"

M.colors = {
  bg = "#0a0a0a",
  bg2 = "#0f0f0f",
  bg3 = "#141414",
  bg4 = "#1a1a1a",
  fg = "#d4d4d4",
  fg2 = "#a0a4ac",
  fg3 = "#6e7178",
  comment = "#5c6370",

  red = "#e06c75",
  orange = "#d19a66",
  yellow = "#e5c07b",
  green = "#7ec699",
  cyan = "#56b6c2",
  blue = "#61afef",
  purple = "#b48ad8",

  accent = "#61afef",
  warm = "#d19a66",
  func = "#61afef",
  keyword = "#b48ad8",

  error = "#e06c75",
  warning = "#e5c07b",
  info = "#61afef",
  hint = "#56b6c2",

  visual = "#1f2937",
  cursorline = "#111111",
  search_bg = "#2e3a2e",
  inc_bg = "#d19a66",

  git_add = "#7ec699",
  git_change = "#61afef",
  git_delete = "#e06c75",
  git_dirty = "#d19a66",

  border = "#0a0a0a",
  none = "NONE",
}

return M
