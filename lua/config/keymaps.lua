-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = false })

-- Toggle comments on the current line or visual selection.
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("x", "<C-/>", "gc", { remap = true, desc = "Toggle comment" })
-- Many terminals report Ctrl+/ as Ctrl+_; keep that encoding available too.
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("x", "<C-_>", "gc", { remap = true, desc = "Toggle comment" })
