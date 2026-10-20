-- NotionDark theme for LazyVim
-- Inspired by Notion's dark mode: dark charcoal bg, bright syntax, clear selection.

local M = {}

M.name = "notiondark"
M.colors = require("notiondark.colors").colors

function M.setup(opts)
  opts = opts or {}

  if opts.colors then
    M.colors = vim.tbl_deep_extend("force", M.colors, opts.colors)
  end

  vim.cmd("colorscheme notiondark")
end

function M.load()
  -- colors/notiondark.lua applies highlights when the colorscheme is loaded
  vim.cmd("colorscheme notiondark")
end

return M
