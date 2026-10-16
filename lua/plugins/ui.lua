-- Borderless, seamless UI configuration.
-- Disables plugin-native borders/separators and keeps floats on the editor background.

return {
  -- Snacks: dashboard, terminal, notifier, picker, input — all borderless
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      terminal = {
        enabled = true,
        win = {
          -- seamless terminal split: no border, same bg
          border = "none",
          wo = {
            winbar = "",
            winhighlight = "Normal:Normal,NormalNC:Normal,WinSeparator:Normal",
          },
        },
      },
      styles = {
        notification = {
          wo = { winhighlight = "Normal:Normal,NormalNC:Normal,FloatBorder:Normal" },
        },
        -- Make all snacks floats sit on the editor background
        input = {
          wo = { winhighlight = "Normal:Normal,NormalNC:Normal,FloatBorder:Normal" },
        },
        dashboard = {
          wo = { winhighlight = "Normal:Normal,NormalNC:Normal,FloatBorder:Normal" },
        },
      },
    },
  },

  -- Noice: borderless cmdline/popup UI
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline_popup",
        opts = {
          border = { style = "none" },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "Normal",
            },
          },
        },
      },
      popupmenu = {
        enabled = true,
        opts = {
          border = { style = "none" },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "Normal",
              PmenuSel = "PmenuSel",
            },
          },
        },
      },
      views = {
        cmdline_popup = {
          border = { style = "none" },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "Normal",
            },
          },
        },
        popupmenu = {
          border = { style = "none" },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "Normal",
            },
          },
        },
        hover = {
          border = { style = "none" },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "Normal",
            },
          },
        },
        confirm = {
          border = { style = "none" },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "Normal",
            },
          },
        },
        mini = {
          border = { style = "none" },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "Normal",
            },
          },
        },
        lspprogress = {
          border = { style = "none" },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "Normal",
            },
          },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
    },
  },

  -- blink.cmp: borderless completion menu
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "none",
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:Normal,CursorLine:BlinkCmpMenuSelection,Search:None",
          scrollbar = false,
          cmdline_position = function()
            local cmp = require("blink.cmp")
            local row, col = cmp.get_win_cursor()
            return { row + 2, col }
          end,
        },
        documentation = {
          window = {
            border = "none",
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:Normal",
          },
        },
        ghost_text = { enabled = true },
      },
      signature = {
        window = {
          border = "none",
          winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:Normal",
        },
      },
      keymap = {
        preset = "default",
      },
    },
  },

  -- lualine: minimal seamless statusline (same bg, no separators)
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = {
          normal = {
            a = { fg = "#d4d4d4", bg = "#0a0a0a" },
            b = { fg = "#a0a4ac", bg = "#0a0a0a" },
            c = { fg = "#6e7178", bg = "#0a0a0a" },
          },
          insert = { a = { fg = "#d4d4d4", bg = "#0a0a0a" } },
          visual = { a = { fg = "#d4d4d4", bg = "#0a0a0a" } },
          replace = { a = { fg = "#d4d4d4", bg = "#0a0a0a" } },
          command = { a = { fg = "#d4d4d4", bg = "#0a0a0a" } },
          inactive = {
            a = { fg = "#6e7178", bg = "#0a0a0a" },
            b = { fg = "#6e7178", bg = "#0a0a0a" },
            c = { fg = "#6e7178", bg = "#0a0a0a" },
          },
        },
        component_separators = "",
        section_separators = "",
        globalstatus = true,
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },

  -- bufferline: minimal tabs, same bg, no separators
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "buffers",
        themable = false,
        separator_style = { "", "" },
        always_show_bufferline = false,
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        show_duplicate_prefix = false,
        diagnostics = false,
        color_icons = false,
        offsets = {},
        highlights = {
          fill = { bg = "#0a0a0a" },
          background = { fg = "#6e7178", bg = "#0a0a0a" },
          buffer_visible = { fg = "#a0a4ac", bg = "#0a0a0a" },
          buffer_selected = { fg = "#d4d4d4", bg = "#0a0a0a" },
          separator = { fg = "#0a0a0a", bg = "#0a0a0a" },
          separator_visible = { fg = "#0a0a0a", bg = "#0a0a0a" },
          separator_selected = { fg = "#0a0a0a", bg = "#0a0a0a" },
          indicator_selected = { fg = "#d4d4d4", bg = "#0a0a0a" },
          modified = { fg = "#d19a66", bg = "#0a0a0a" },
          modified_selected = { fg = "#d19a66", bg = "#0a0a0a" },
        },
      },
    },
  },

  -- which-key: borderless popup
  {
    "folke/which-key.nvim",
    opts = {
      -- preset = "classic",
      win = {
        border = "none",
        padding = { 1, 2 },
      --   wo = {
      --     winhighlight = "Normal:Normal,FloatBorder:Normal",
      --   },
      -- },
      -- icons = {
      --   rules = false,
      },
    },
  },

  -- trouble: borderless list
  {
    "folke/trouble.nvim",
    opts = {
      focus = true,
      win = {
        border = "none",
      },
    },
  },

  -- gitsigns: subtle, no extra chrome
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "│" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      signcolumn = true,
      current_line_blame = false,
    },
  },

  -- mason: borderless
  -- {
  --   "williambason/mason.nvim",
  --   opts = {
  --     ui = {
  --       border = "none",
  --       icons = {
  --         package_installed = "✓",
  --         package_pending = "➜",
  --         package_uninstalled = "✗",
  --       },
  --     },
  --   },
  -- },

  -- conform: no visual changes needed, keep formatter silent
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
