-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = false })

-- LazyVim defers clipboard handling until VeryLazy; apply this after its callback.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Swap the vertical movement keys in normal, visual, and operator-pending modes.
vim.keymap.set({ "n", "x", "o" }, "j", "k", { desc = "Move up" })
vim.keymap.set({ "n", "x", "o" }, "k", "j", { desc = "Move down" })

-- Toggle comments on the current line or visual selection.
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("x", "<C-/>", "gc", { remap = true, desc = "Toggle comment" })
-- Many terminals report Ctrl+/ as Ctrl+_; keep that encoding available too.
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("x", "<C-_>", "gc", { remap = true, desc = "Toggle comment" })
