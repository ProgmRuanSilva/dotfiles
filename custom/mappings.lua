---@type MappingsTable
-- use tcd command on : to jump to another folder
local M = {}

M.general = {
  i = {
    ["<C-f>"] = { "<C-o>w", "next word"},
    ["<C-n>"] = { "<C-o>b", "back word"},
    ["<C-s>"] = { "<cmd> w! <CR>", "save"},
    ["<C-p>"] = {"<C-o>p", "simple paste"},
    ["jk"] = {"<ESC>", "escape insert mode"},
    ["<C-z>"] = { "<C-o>u", "restore newest"},
    ["<C-a>"] = { "<C-o><End>", "end of line"},
    ["<C-d>"] = { "<C-o>dw", "delete next word"},
    ["<C-r>"] = { "<C-o><C-u>", "jump 5 lines up"},
    ["<C-v>"] = { "<C-o><C-d>", "jump 5 lines down"},
    ["<C-e>"] = {"<C-o><S-v>y<C-o>p", "paste content in line below"},
    ["<C-x>"] = {"<C-o><S-v>x"}
  },
  n = {
    ["<C-a>"] = {"<S-v>yp", "copy line below"},
    ["<leader>w"] = {"<cmd>q<CR>", "close tab"},
    ["<leader>p"] = {"<cmd>tabnew<CR>", "new tab"},
    ["<C-q>"] = {"<S-v>y<S-p>", "copy line before"},
    ["<leader><Tab>"] = {"<cmd>tabn<CR>", "switch tabs"},
    ["<leader>i"] = { "<cmd>vsplit<CR>", "new vertical split" },
    ["<leader>o"] = { "<cmd>split<CR>", "new horizontal split"},
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-x>"] = {"<S-v>x", "exclude current line"},
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
