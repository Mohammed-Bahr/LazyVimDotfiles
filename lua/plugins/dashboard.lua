local logo = [[
██████╗  █████╗ ██╗  ██╗██████╗ ██╗   ██╗██╗███╗   ███╗    
██╔══██╗██╔══██╗██║  ██║██╔══██╗██║   ██║██║████╗ ████║    
██████╔╝███████║███████║██████╔╝██║   ██║██║██╔████╔██║    
██╔══██╗██╔══██║██╔══██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║    
██████╔╝██║  ██║██║  ██║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║    
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝    
]]

return {
  -- Snacks dashboard with the BAHRVIM header.
  -- NOTE: do not enable `nvimdev/dashboard-nvim` on the side: it conflicts
  -- with Snacks.dashboard and stops the Snacks dashboard from setting up.
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = logo,
        },
      },
    },
  },
}
