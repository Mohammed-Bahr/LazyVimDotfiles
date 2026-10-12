-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable transparent background (requires terminal with transparency)
vim.api.nvim_create_autocmd({ "ColorScheme", "UIEnter" }, {
  group = vim.api.nvim_create_augroup("TransparentBG", { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = nil })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = nil })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
  end,
})
