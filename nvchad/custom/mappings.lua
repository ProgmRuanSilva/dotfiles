---@type MappingsTable

local M = {}

M.general = {

  i = {

  --Navigate 
    ["<A-k>"] = { "<Up>", "Move up" },
    ["<A-j>"] = { "<Down>", "Move down" },
    ["<A-h>"] = { "<Left>", "Move left" },
    ["<A-l>"] = { "<Right>", "Move right" },
    ["<A-n>"] = { "<C-o>b", "back word phrase"},
    ["<A-m>"] = { "<C-o>w", "next word phrase"},
    ["<A-f>"] = { "<C-o><End>", "end of line"},
    ["<A-g>"] = { "<C-o><Home>", "beggining of line"},

  --Deletes cursor
    ["<A-i>"] = { "<C-o>dw", "delete next word"},
    ["<A-u>"] = { "<C-o>db", "delete previews word"},
    ["<A-ç>"] = { "<Backspace>", "delete previews word"},
    ["<A-Ç>"] = { "<Backspace>", "delete previews word in CapsLock"},
    ["<A-d>"] = {"<C-o><S-v>x", "delete current line"},

  --Line addiction
    ["<A-p>"] = {"<C-o>o", "empty line on bottom"},
    ["<A-o>"] = {"<C-o><S-o>", "empty line on top"},
    ["<A-a>"] = {"<C-o><S-v>y<C-o>p", "copy line below"},

  --Save and Restore
    ["<A-s>"] = { "<cmd>w!<CR>", "save"},
    ["<A-c>"] = { "<C-o>u", "restore newest"},
    ["<A-r>"] = {"<C-o><C-r>", "undo restore"},

  --Clipboard
    ["<A-[>"] = {"<C-o>p", "simple paste"},

  --Escape of insertion mode
    ["<A-v>"] = { "<ESC>", "escape insert mode" },

  --Hot Keys
    ["<A-/>"] = {"<Enter>", "enter key"},
    ["<A-.>"] = {"<Esc>", "esc key"},
  },

  n = {

  --Save
    ["<A-s>"] = {"<cmd>w!<CR>"},

  --Move Lines
    ["<A-n>"]= {"<S-v>xp", "move line to down"},
    ["<A-m>"]= {"<S-v>xk<S-p>", "move line to up"},

  --Restoration
    ["<A-c>"] = {"<C-r>", "undo restore"},

  --Tabs
    ["<leader>u"] = {"<cmd>q<CR>", "close tab"},
    ["<leader>h"] = {"<cmd>tabnew<CR>", "new tab"},
    ["<leader>k"] = {"<cmd>tabn<CR>", "switch tabs"},

  --Splits
    ["<leader>i"] = { "<cmd>vsplit<CR>", "new vertical split" },
    ["<leader>o"] = { "<cmd>split<CR>", "new horizontal split"},

  --TabResize
    ["<S-c>"] = {"<C-w>>", "move current split to left"},
    ["<S-b>"] = {"<C-w><", "move current split to right"},
    ["<S-m>"] = {"<C-w>-", "move current split to down"},
    ["<S-n>"] = {"<C-w>+", "move current split to up"},

  --Navigation
    ["f"] = {"<END>", "navigate to end of line"},
    ["ff"] = {"<HOME>", "navigate to beggining of line"},

  --Navigation between splits
    ["<A-j>"] = { "<C-w>h", "Window left" },
    ["<A-l>"] = { "<C-w>l", "Window right" },
    ["<A-h>"] = { "<C-w>j", "Window down" },
    ["<A-k>"] = { "<C-w>k", "Window up" },

  --Navigate Words
    ["n"] = {"b", "back one word for lazy people"},
    ["m"] = {"w", "next one word for lazy people"},

  --Line Addiction
    ["q"] = {"o<C-c>", "add a new line in normal mode"},
    ["<A-p>"] = {"<S-o><C-c>", "add a new line below in normal mode"},
    ["<A-o>"] = {"<S-o>", "insert on line below"},
    ["<A-a>"] = {"<S-v>yp", "copy line below"},
    ["<A-y>"] = {"<S-v>y", "copy line"},

  --Navbuddy
    ["<leader>d"] = { "<cmd>Navbuddy<CR>", "Navbuddy Toggle" },

  --Command mode
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

  --Hot Keys
    ["<A-/>"] = {"<Enter>", "enter key"},
    ["<A-q>"] = {"<Esc>", "esc key"},

  --Change Directory
    ["<leader>mn"] = {"<cmd>tcd ~/.config/nvim/<CR>", "chage directory to nvim configuration"},
    ["<leader>mp"] = {"<cmd>tcd ~/projects/<CR>", "change directory to projects folder"},
    ["<leader>mh"] = {"<cmd>tcd ~/<CR>", "change home directory"},

  --test zone
    ["dm"] = {"dw"},
    ["dn"] = {"db"},

  },

  v = {

  --Move
    ["m"] = {"w"},
    ["n"] = {"b"},

  --Lines
    ["<A-f>"] = {"0"},
    ["f"] = {"$"},

  --Escape Mode
    ["<A-q>"] = {"<Esc>"},
  },
}


--Overwrites
M.nvimtree = {
  n = {
    ["<C-n>"] = {"", "none"},
    ["<leader>j"] = {"<cmd>NvimTreeToggle<CR>", "Toggle nvimtree"}
   }
 }

M.telescope = {
  i = {
    ["<A-/>"] = {"<Enter>", "enter key"},
    ["<A-q>"] = {"<Esc>", "esc key"},
  },

  n = {
    ["<A-/>"] = {"<Enter>", "enter key"},
    ["<A-q>"] = {"<Esc>", "esc key"},
  }

}

M.nvterm = {

  t = {
    ["<A-d>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    ["<A-k>"] = {"<C-l>", "clear current terminal"},
    ["<A-j>"] = {"<Enter>", "insert enter key in terminal mode"},
    ["<A-ç>"] = {"<Backspace>", "insert enter key in terminal mode"},

    ["<A-h>"] = {"<A-h>", ""},

    ["<A-g>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
  },

  n = {

    ["<A-g>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    --C++
    ["<leader>cp"] = {
      function()
        require("nvterm.terminal").send("clear && g++ -o out " .. vim.fn.expand "%" .. " && ./out", "vertical")
      end,
      "compile & run a cpp file",
    },

    --C
    ["<leader>cc"] = {
      function()
        require("nvterm.terminal").send("clear && gcc -o out " .. vim.fn.expand "%" .. " && ./out", "vertical")
      end,
      "compile & run a c file",
    },

    --Rust
    ["<leader>cr"] = {
      function()
        require("nvterm.terminal").send("clear && cargo run ." .. vim.fn.expand "%","vertical")
      end,
      "compile & run rust file",
    },

    --Go
    ["<leader>cg"] = {
      function()
        require("nvterm.terminal").send("clear && go run ." .. vim.fn.expand "%","vertical")
      end,
      "compile & run go file",
    },

  },
}

return M
