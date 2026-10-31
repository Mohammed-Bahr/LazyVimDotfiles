return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      -- `opts.defaults` is deprecated in which-key v3 and made LazyVim warn on
      -- startup. Hiding the group through `spec` achieves the same thing.
      spec = {
        { "<leader>w", hidden = true },
      },
    },
  },
  {
    "Pocco81/auto-save.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      -- TextChangedI saved on every keystroke while typing, which spammed
      -- "AutoSave: saved at ..." messages and could persist half-written code.
      trigger_events = { "InsertLeave", "TextChanged" },
    },
  },
}
