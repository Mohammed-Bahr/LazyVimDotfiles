return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = { defaults = { ["<leader>w"] = nil } },
  },
  {
    "Pocco81/auto-save.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      trigger_events = { "InsertLeave", "TextChanged", "TextChangedI" },
    },
  },
}
