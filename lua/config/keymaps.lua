-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = false })

-- The system clipboard is synced automatically via `clipboard=unnamedplus`
-- (see options.lua), so plain y/d/c and p already hit the system clipboard.
-- These explicit keymaps are kept as aliases that force the "+ register.
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+yg_', { desc = "Copy line to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste from system clipboard (before)" })

-- Swap the vertical movement keys in normal, visual, and operator-pending modes.
-- vim.keymap.set({ "n", "x", "o" }, "j", "k", { desc = "Move up" })
-- vim.keymap.set({ "n", "x", "o" }, "k", "j", { desc = "Move down" })

-- Toggle comments on the current line or visual selection.
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("x", "<C-/>", "gc", { remap = true, desc = "Toggle comment" })
-- Many terminals report Ctrl+/ as Ctrl+_; keep that encoding available too.
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("x", "<C-_>", "gc", { remap = true, desc = "Toggle comment" })
