-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Do not auto-sync the system clipboard. With `unnamedplus`, every yank,
-- delete, change and paste-over-selection overwrites the system clipboard.
-- Clipboard access is now explicit via <leader>y / <leader>p (see keymaps.lua).
vim.opt.clipboard = ""

-- Allow Ghostty's horizontal touchpad scroll events to pan long lines.
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.mousescroll = "ver:3,hor:5"
