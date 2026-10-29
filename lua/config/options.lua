-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use the system clipboard for yanks and puts through the unnamed register.
vim.opt.clipboard = "unnamedplus"

-- Allow Ghostty's horizontal touchpad scroll events to pan long lines.
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.mousescroll = "ver:3,hor:5"
