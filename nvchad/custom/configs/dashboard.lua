require("dashboard").setup({
  theme = "hyper",
  disable_move = true,
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f",
      },
      {
        desc = " Apps",
        group = "DiagnosticHint",
        action = "Telescope zoxide list",
        key = "k",
      },
      {
        desc = " Oldfiles",
        group = "Label",
        action = "Telescope oldfiles",
        key = "d",
      },
    },
  },
})
