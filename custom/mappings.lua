---@type MappingsTable
-- use tcd command on : to jump to another folder
local M = {}

M.general = {
  i = {
    ["<C-f>"] = { "<C-o>w", "next word"},
    ["<C-n>"] = { "<C-o>b", "back word"},
    ["<C-s>"] = { "<cmd> w! <CR>", "save"},
    ["<C-z>"] = { "<C-o>u", "restore newest"},
    ["<C-d>"] = { "<C-o>dw", "delete next word"},
    ["<C-r>"] = { "<C-o><C-u>", "jump 5 lines up"},
    ["<C-v>"] = { "<C-o><C-d>", "jump 5 lines down"},
    ["<C-a>"] = { "<C-o><End>", "end of line"},
    ["jk"] = {"<ESC>", "escape insert mode"},
    ["<C-e>"] = {"<C-o>p", "paste content"}, 
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>i"] = { "<cmd>vsplit<CR>", "new vertical split" },
    ["<leader><Tab>"] = {"<cmd>tabn<CR>", "switch tabs"},
    ["<leader>p"] = {"<cmd>tabnew<CR>", "new tab"},
    ["<leader>w"] = {"<cmd>q<CR>", "close tab"},
  },
}

M.nvterm = {
  n = {
    ["<leader>gc"] = {
      function()
        require("nvterm.terminal").send("clear && g++ -o out " .. vim.fn.expand "%" .. " && ./out", "vertical")
      end,

      "compile & run a cpp file",
    },
  },
}

return M
