return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    -- priority = 1000,
    opts = {
      flavour = "mocha", -- mocha, macchiato, frappe, or latte
      transparent_background = true, -- works with our transparency setup
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      -- color_overrides = {
      --   mocha = {
      --     base = "#110f0e",
      --     mantle = "#0c0a0a",
      --     crust = "#050505",
      --     surface0 = "#221f1d",
      --     surface1 = "#2c2826",
      --     surface2 = "#37322f",
      --     text = "#e6e1de",
      --     subtext1 = "#d0c9c5",
      --     subtext0 = "#b8b0ab",
      --     overlay2 = "#a09793",
      --     overlay1 = "#897f7b",
      --     overlay0 = "#736965",
      --   },
      -- },
      -- custom_highlights = function(colors)
      --   return {
      --     WinSeparator = { fg = colors.surface1, bg = "NONE" },
      --     NvimTreeWinSeparator = { fg = colors.surface1, bg = "NONE" },
      --     NormalFloat = { bg = colors.mantle },
      --     FloatBorder = { fg = colors.surface2, bg = colors.mantle },
      --   }
      -- end,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For LazyVim extra plugins
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        dashboard = true,
        neotree = true,
        noice = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    },
    -- config = function(_, opts)
    --   require("catppuccin").setup(opts)
    --   -- Allow switching directly via :DarkHeavy or :colorscheme catppuccin
    --   vim.api.nvim_create_user_command("DarkHeavy", function()
    --     vim.cmd("colorscheme catppuccin")
    --   end, { desc = "Load DarkHeavy theme" })
    -- end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    opts = {
      transparent = true,
      theme = "wave", -- Load "wave" theme when 'background' option is not set
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    dir = vim.fn.stdpath("config") .. "/lua/Themes/NotionDark/notion-dark",
    name = "notiondark",
    lazy = false,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    lazy = true,
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
