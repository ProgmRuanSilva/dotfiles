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
    ["<A-g>"] = { "<C-o><End>", "end of line"},
    ["<A-f>"] = { "<cmd>HopWord<CR>", "HopWord command to go to selected word"},
    ["<A-c>"] = { "<cmd>HopAnywhere<CR>", "HopWord command to go to selected word"},

  --Deletes cursor
    ["<A-o>"] = { "<C-o>dw", "delete next word"},
    ["<A-i>"] = { "<C-o>db<Backspace>", "delete previews word"},
    ["<A-ç>"] = { "<Backspace>", "delete previews word"},
    ["<A-Ç>"] = { "<Backspace>", "delete previews word in CapsLock"},
    ["<A-d>"] = {"<C-o>d", "delete current line"},

  --Line addiction
    ["<A-,>"] = {"<C-o>o", "empty line on bottom"},
    ["<A-.>"] = {"<C-o><S-o>", "empty line on top"},
    ["<A-u>"] = {"<C-o><S-v>y<C-o>p", "copy line below"},

  --Save and Restore
    ["<A-s>"] = { "<cmd>w!<CR>", "save"},
    ["<A-w>"] = { "<C-o>u", "restore newest"},
    ["<A-r>"] = {"<C-o><C-r>", "undo restore"},

  --Clipboard
    ["<A-p>"] = {"<C-o>p", "simple paste"},

  --Escape of insertion mode
    ["<A-v>"] = { "<ESC>", "escape insert mode" },

  --Test Area
    ["<A-9>"] = {"()<Left>", "add comma on insertion mode"},
    ["<A-0>"] = {")", "add finaly comma on insertion mode"},

    ["<A-[>"] = {"{}<Left>", "add brackets on insetion mode"},
    ["<A-]>"] = {"}", "add finaly brackets on insetion mode"},
    ["<A-a>"] = {"<Esc><right><Delete>i"},

  },

  n = {

  --Save
    ["<A-s>"] = {"<cmd>w!<CR>"},

  --Move Lines
    ["<A-n>"]= {"<S-v>xp", "move line to down"},
    ["<A-m>"]= {"<S-v>xk<S-p>", "move line to up"},

  --Restoration
    ["<A-r>"] = {"<C-r>", "undo restore"},

  --Tabs
    ["<leader>u"] = {"<cmd>q<CR>", "close tab"},
    ["<leader>h"] = {"<cmd>tabnew<CR>", "new tab"},
    ["<leader>j"] = {"<cmd>tabn<CR>", "switch tabs"},

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
    [","] = {"o<C-c>", "add a new line in normal mode"},
    ["."] = {"<S-o><C-c>", "add a new line below in normal mode"},
    ["<A-o>"] = {"<S-o>", "insert on line below"},
    ["<A-a>"] = {"<S-v>yp", "copy line below"},

  --Navbuddy
    ["<leader>fd"] = { "<cmd>Navbuddy<CR>", "Navbuddy Toggle" },

  --ZenMode
    ["<leader>fb"] = {"<cmd>ZenMode<CR>"},

  --Command mode
    [";"] = { "<cmd>FineCmdline<CR>", "enter command mode"},
    ["<A-q>"] = {"<Esc>", "esc key"},

  --Change Directory
    ["<leader>mn"] = {"<cmd>tcd ~/.config/nvim/<CR>", "chage directory to nvim configuration"},
    ["<leader>mp"] = {"<cmd>tcd ~/projects/<CR>", "change directory to projects folder"},
    ["<leader>mh"] = {"<cmd>tcd ~/<CR>", "change home directory"},

  --Deletes remapping
    ["ç"] = {"<right><Delete>"},
    ["dm"] = {"dw"},
    ["dn"] = {"db"},
    ["df"] = {"d$"},

  --Hop Configuration
    ["<leader>kk"] = {"<cmd>HopWord<CR>"},
    ["<leader>kj"] = {"<cmd>HopAnywhere<CR>"},

  --Git
    ["<leader>gf"] = {"<cmd>GitBlameToggle<CR>"},
    ["<leader>gc"] = {"<cmd>Telescope git_commits<CR>"},
    ["<leader>gv"] = {"<cmd>Telescope git_bcommits<CR>"},
    ["<leader>gb"] = {"<cmd>Telescope git_branches<CR>"},

  --Telescope
    ["<leader><leader>"] = {"<cmd>Telescope find_files<CR>"},
    ["<leader>fm"] = {"<cmd>Telescope man_pages<CR>"},
    ["<leader>fp"] = {"<cmd>Telescope jumplist<CR>"},
    ["<leader>fn"] = {"<cmd>Telescope marks<CR>"},
    ["<leader>d"] = {"<cmd>Telescope oldfiles<CR>"},
    ["<leader>fj"] = {"<cmd>Telescope file_browser<CR>"},
    ["<leader>k"] = {"<cmd>Telescope zoxide list<CR>"},

  --Octo
    ["<leader>gpl"] = {"<cmd>Octo pr list<CR>"},
    ["<leader>gpc"] = {"<cmd>Octo pr create<CR>"},
    ["<leader>gpd"] = {"<cmd>Octo pr delete<CR>"},

    ["<leader>grl"] = {"<cmd>Octo repo list<CR>"},
    ["<leader>grc"] = {"<cmd>Octo repo create<CR>"},
    ["<leader>grd"] = {"<cmd>Octo repo delete<CR>"},

    ["<leader>gil"] = {"<cmd>Octo issue list<CR>"},
    ["<leader>gic"] = {"<cmd>Octo issue create<CR>"},
    ["<leader>gid"] = {"<cmd>Octo issue delete<CR>"},

    ["<S-k>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

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

  c = {
    --Moviments on Command mode
    ["<A-ç>"] = {"<Backspace>"},
    ["<A-j>"] = {"<Enter>"},
    ["<A-h>"] = {"<Left>"},
    ["<A-l>"] = {"<Right>"},
    ["<A-n>"] = {"<C-b>"},
  },

}


--Overwrites
M.nvimtree = {
  n = {
    ["<C-n>"] = {"", "none"},
    ["<leader>l"] = {"<cmd>NvimTreeToggle<CR>", "Toggle nvimtree"}
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


M.tabufline = {
  n = {
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-j>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}


M.nvterm = {

  t = {
    ["<A-d>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    ["<A-j>"] = {"<Enter>", "insert enter key in terminal mode"},
    ["<A-ç>"] = {"<Backspace>", "insert enter key in terminal mode"},
    ["<A-h>"] = {"<A-h>", "clear line terminal"},

    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
  },

  n = {

    ["<A-f>"] = {
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
