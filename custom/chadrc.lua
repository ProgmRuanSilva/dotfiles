---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"


M.ui = {
  theme = "chadracula",
  theme_toggle = { "chadracula", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- Background to transparent
vim.cmd('highlight Normal guibg=none')
vim.cmd('highlight NonText guibg=none')

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
