---@type MappingsTable

local M = {}

M.general = {

  i = {

  --Navigation cursor
    ["<C-f>"] = { "<C-o>w", "next word"},
    ["<C-n>"] = { "<C-o>b", "back word"},
    ["<C-a>"] = { "<C-o><End>", "end of line"},

  --Deletes cursor
    ["<C-d>"] = { "<C-o>dw", "delete next word"},
    ["<C-x>"] = {"<C-o><S-v>x", "delete current line"},

  --Save and Restore
    ["<C-s>"] = { "<cmd> w! <CR>", "save"},
    ["<C-z>"] = { "<C-o>u", "restore newest"},

  --Clipboard
    ["<C-p>"] = {"<C-o>p", "simple paste"},
    ["<C-e>"] = {"<C-o><S-v>y<C-o>p", "paste content in line below"},

  },

  n = {

  --Move Lines
    ["<C-j>"]= {"<S-v>xp"},
    ["<C-k>"]= {"<S-v>xk<S-p>"},

  --Clipboard
    ["<C-a>"] = {"<S-v>yp", "copy line below"},

  --Tabs
    ["<leader>w"] = {"<cmd>q<CR>", "close tab"},
    ["<leader>p"] = {"<cmd>tabnew<CR>", "new tab"},
    ["<leader><Tab>"] = {"<cmd>tabn<CR>", "switch tabs"},

  --Splits
    ["<leader>i"] = { "<cmd>vsplit<CR>", "new vertical split" },
    ["<leader>o"] = { "<cmd>split<CR>", "new horizontal split"},

  --Command mode
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

  --Deletes
    ["<C-x>"] = {"<S-v>x", "exclude current line"},

  --Navigation
    ["f"] = {"<HOME>", "navigate to beggining of line"},
    ["<S-f>"] = {"<END>", "navigate to end of line"},

  --Line Addiction
    ["m"] = {"o<C-c>", "add a new line in normal mode"},
    ["<S-m>"] = {"<S-o><C-c>", "add a new line below in normal mode"},

  --Navbuddy
    ["<C-q>"] = { "<cmd>Navbuddy<CR>", "Navbuddy Toggle" },

  },
}


--Overwrites

M.nvimtree = {
  n = {
    ["<C-n>"] = {"", "nothig to say"},
    ["<leader>e"] = {"<cmd> NvimTreeToggle<CR>", "Focus nvimtree"}
   }
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
