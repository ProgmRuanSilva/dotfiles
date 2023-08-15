---@type MappingsTable
-- use tcd command on : to jump to another folder
local M = {}

M.general = {
  i = {
    ["<C-f>"] = { "<C-o>w", "next word"},
    ["<C-n>"] = { "<C-o>b", "back word"},
    ["<C-s>"] = { "<cmd> w! <CR>", "save"},
    ["<C-e>"] = { "<C-o>u", "restore newest"},
    ["<C-d>"] = { "<C-o>dw", "delete next word"},
    ["<C-r>"] = { "<C-o><C-u>", "jump 5 lines up"},
    ["<C-v>"] = { "<C-o><C-d>", "jump 5 lines down"}
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>i"] = { "<cmd>vsplit<CR>", "new vertical split" },
    ["<leader>p"] = {"<cmd>tabnew<CR>", "new tab"},
    ["<leader><Tab>"] = {"<cmd>tabn<CR>", "switch tabs"},
    ["<leader>w"] = {"<cmd>q<CR>", "close tab"},
  },
}


return M
