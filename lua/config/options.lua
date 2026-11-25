-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Sync the system clipboard (Wayland: uses wl-copy/wl-paste).
-- `unnamedplus` makes every yank/delete/change use the "+ register, so plain
-- y/d/c/x/p work with other apps just like a normal Ctrl+C / Ctrl+V.
-- Note: this also means deletes overwrite the clipboard; use "_d (blackhole
-- register) if you want to delete without clobbering it.
vim.opt.clipboard = "unnamedplus"

-- Allow Ghostty's horizontal touchpad scroll events to pan long lines.
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.mousescroll = "ver:3,hor:5"
