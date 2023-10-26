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
    ["<A-p>"] = { "<Backspace>", "delete previews word"}, -- not working on arch craft
    ["<A-Ç>"] = { "<Backspace>", "delete previews word in CapsLock"},
    ["<A-d>"] = {"<C-o>d", "delete current line"},

  --Line addiction
    ["<A-,>"] = {"<C-o>o", "empty line on bottom"},
    ["<A-.>"] = {"<C-o><S-o>", "empty line on top"},
    -- ["<A-u>"] = {"<C-o><S-v>y<C-o>p", "copy line below"},

  --Save and Restore
    ["<A-s>"] = { "<cmd>w!<CR>", "save"},
    ["<A-w>"] = { "<C-o>u", "restore newest"},
    ["<A-r>"] = {"<C-o><C-r>", "undo restore"},

  --Clipboard
    ["<A-u>"] = {"<C-o>p", "simple paste"},

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
    ["<S-n>"]= {"<S-v>xp", "move line to down"},
    ["<S-m>"]= {"<S-v>xk<S-p>", "move line to up"},

  --Restoration
    ["<A-r>"] = {"<C-r>", "undo restore"},

  --Tabs
    ["<leader>u"] = {"<cmd>q<CR>", "close tab"},
    ["<leader>mn"] = {"<cmd>tabnew<CR>", "new tab"},
    ["<leader>mm"] = {"<cmd>tabn<CR>", "switch tabs"},
    ["<leader>ms"] = {"<cmd>Telescope buffers<CR>", "List Tabs"},

  --Splits
    ["<leader>i"] = { "<cmd>vsplit<CR>", "new vertical split" },
    ["<leader>o"] = { "<cmd>split<CR>", "new horizontal split"},

  --TabResize
    ["<S-c>"] = {"<C-w>>", "move current split to left"},
    ["<S-b>"] = {"<C-w><", "move current split to right"},
    -- ["<S-m>"] = {"<C-w>-", "move current split to down"},
    -- ["<S-n>"] = {"<C-w>+", "move current split to up"},

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

  --Select Mode
    ["<A-m>"] = {"n", "next one word for lazy people"},
    ["<A-n>"] = {"<S-n>", "next one word for lazy people"},

  --Line Addiction
    [","] = {"o<C-c>", "add a new line in normal mode"},
    ["."] = {"<S-o><C-c>", "add a new line below in normal mode"},
    ["<A-o>"] = {"<S-o>", "insert on line below"},
    ["<A-a>"] = {"<S-v>yp", "copy line below"},

  --Navbuddy
    ["<leader>s"] = { "<cmd>Navbuddy<CR>", "Navbuddy Toggle" },

  --ZenMode
    ["<leader>fb"] = {"<cmd>ZenMode<CR>"},

  --Command mode
    [";"] = { ":", "enter command mode"},
    ["<A-q>"] = {"<Esc>", "esc key"},

  --Deletes remapping
    ["ç"] = {"<right><Delete>"},
    ["dm"] = {"dw"},
    ["dn"] = {"db"},
    ["df"] = {"d$"},

  --Hop Configuration
    ["<leader>kk"] = {"<cmd>HopWord<CR>"},
    ["<leader>kj"] = {"<cmd>HopAnywhere<CR>"},

    ["["] = {"<cmd>NoiceTelescope<CR>"},

  --Telescope
    ["<leader><leader>"] = {"<cmd>Telescope find_files<CR>"},
    ["<leader>fm"] = {"<cmd>Telescope man_pages<CR>"},
    ["<leader>fp"] = {"<cmd>Telescope jumplist<CR>"},
    ["<leader>fn"] = {"<cmd>Telescope marks<CR>"},
    ["<leader>d"] = {"<cmd>Telescope oldfiles<CR>"},
    ["<leader>j"] = {"<cmd>Telescope file_browser<CR>"},
    ["<leader>k"] = {"<cmd>Telescope zoxide list<CR>"},

    --Docker
    ["<leader>wc"] = {"<cmd>Telescope docker containers<CR>"},
    ["<leader>wi"] = {"<cmd>Telescope docker images<CR>"},
    ["<leader>wn"] = {"<cmd>Telescope docker networks<CR>"},
    ["<leader>ws"] = {"<cmd>Telescope docker volumes<CR>"},
    ["<leader>wm"] = {"<cmd>Telescope docker machines<CR>"},
    ["<leader>wf"] = {"<cmd>Telescope docker compose<CR>"},


    --Git
    ["<leader>gf"] = {"<cmd>GitBlameToggle<CR>"},
    ["<leader>gc"] = {"<cmd>Telescope gitmoji<CR>"},
    ["<leader>gv"] = {"<cmd>Telescope git_bcommits<CR>"},
    ["<leader>gb"] = {"<cmd>Telescope git_branches<CR>"},
    ["<leader>gs"] = {"<cmd>Telescope git_status<CR>"},
    ["<leader>gd"] = {"<cmd>DiffviewOpen<CR>"},


  --Octo

    ["<leader>ga"] = {"<cmd>Octo actions<CR>", "help command of Octo"},

    --Pull Requests
    ["<leader>gpl"] = {"<cmd>Octo pr list<CR>"},
    ["<leader>gpc"] = {"<cmd>Octo pr create<CR>"},
    ["<leader>gpcd"] = {"<cmd>Octo pr delete<CR>"},

    ["<leader>gpe"] = {"<cmd>Octo pr edit<CR>"},
    ["<leader>gph"] = {"<cmd>Octo pr checkout<CR>"},
    ["<leader>gpm"] = {"<cmd>Octo pr merge<CR>"},
    -- ["<leader>gd"] =  {"<cmd>Octo pr diff<CR>"},
    ["<leader>gpr"] = {"<cmd>Octo pr ready<CR>"},
    ["<leader>qpb"] = {"<cmd>Octo pr browser<CR>"},

    --Repository
    ["<leader>gnl"] = {"<cmd>Octo repo list<CR>"},
    ["<leader>gnc"] = {"<cmd>Octo repo create<CR>"},
    ["<leader>gnd"] = {"<cmd>Octo repo delete<CR>"},

    --Issue
    ["<leader>gil"] = {"<cmd>Octo issue list<CR>"},
    ["<leader>gic"] = {"<cmd>Octo issue create<CR>"},
    ["<leader>gie"] = {"<cmd>Octo issue edit<CR>"},
    ["<leader>gid"] = {"<cmd>Octo issue delete<CR>"},
    ["<leader>gis"] = {"<cmd>Octo issue search<CR>"},

    --Review
    ["<leader>grs"] = {"<cmd>Octo review start<CR>"},
    ["<leader>gru"] = {"<cmd>Octo review submit<CR>"},
    ["<leader>grr"] = {"<cmd>Octo review resume<CR>"},
    ["<leader>grd"] = {"<cmd>Octo review discard<CR>"},
    ["<leader>grc"] = {"<cmd>Octo review comments<CR>"},
    ["<leader>grm"] = {"<cmd>Octo review commit<CR>"},
    ["<leader>grl"] = {"<cmd>Octo review close<CR>"},

  --Goto-Preview
    ["<C-j>"] = {"<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "help page of Octo"},
    ["<S-l>"] = {"<cmd>lua require('goto-preview').goto_preview_references()<CR>", "help page of Octo"},
    ["<S-a>"] = {"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "help page of Octo"},
    ["<C-l>"] = {"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "help page of Octo"},
    ["<C-f>"] = {"<cmd>lua require('goto-preview').goto_preview_declaration()<CR> ", "help page of Octo"},
    -- ["<A-w>"] = {"<cmd>lua require('goto-preview').close_all_win()<CR>", "help page of Octo"},

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
    ["<A-p>"] = {"<Backspace>"},
    ["<A-j>"] = {"<Enter>"},
    ["<A-h>"] = {"<Left>"},
    ["<A-l>"] = {"<Right>"},
    ["<A-c>"] = {"n"},
  },

  --test
  x = {
    ["b"] = {"a"},
  }
}

--Overwrites
M.nvimtree = {
  n = {
    ["<C-n>"] = {"", "none"},
    ["<leader>l"] = {"<cmd>NvimTreeToggle<CR>", "Toggle nvimtree"}
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