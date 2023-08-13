---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["<C-f>"] = { "<C-o>w", "next word"},
    ["<C-n>"] = { "<C-o>b", "next word"},
    ["<C-s>"] = { "<cmd> w! <CR>", "save"}
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --new split
    ["<leader>i"] = { "<cmd> vsplit <CR>", "new vertical split" },

  },
}

-- more keybinds!

return M
