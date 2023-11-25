---@type MappingsTable

local M = {}

M.general = {

  i = {

    -- ainda temos o <A-o> pra poder usar
  --Navigate
    ["<A-k>"] = { "<Up>", "Move up" },
    ["<A-j>"] = { "<Down>", "Move down" },
    ["<A-h>"] = { "<Left>", "Move left" },
    ["<A-l>"] = { "<Right>", "Move right" },
    ["<A-n>"] = { "<C-o>b", "back word phrase"},
    ["<A-m>"] = { "<C-o>w", "next word phrase"},
    ["<A-s>"] = { "<C-o><End>", "end of line"},
    ["<A-f>"] = { "<cmd>HopWord<CR>", "HopWord command to go to selected word"},
    ["<A-a>"] = { "<cmd>HopAnywhere<CR>", "HopWord command to go to selected word"},

  --Deletes cursor
    ["<A-w>"] = { "<C-o>dw", "delete next word"},
    ["<A-q>"] = { "<C-o>db<Backspace>", "delete previews word"},
    ["<A-p>"] = { "<Backspace>", "delete previews word"}, -- not working on arch craft
    -- ["<A-Ç>"] = { "<Backspace>", "delete previews word in CapsLock"},
    -- ["<A-d>"] = {"<C-o>d", "delete current line"},

  --Line addiction
    ["<A-o>"] = {"<C-o>o", "empty line on bottom"},
    -- ["<A-o>"] = {"<C-o><S-o>", "empty line on top"},
    ["<A-b>"] = {"<C-o><S-v>y<C-o>p", "copy line below"},

  --Save and Restore
    ["<A-g>"] = { "<cmd>w!<CR>", "save"},
    -- ["<A-b>"] = { "<C-o>u", "restore newest"},
    ["<A-r>"] = {"<C-o><C-r>", "undo restore"},

  --Clipboard
    ["<A-u>"] = {"<C-o>p", "simple paste"},

  --Escape of insertion mode
    ["<A-v>"] = { "<ESC>", "escape insert mode" },

  --Test Area
    ["<A-9>"] = {"()<Left>", "add comma on insertion mode"},
    ["<A-0>"] = {")", "add finaly comma on insertion mode"},

    -- ["<A-[>"] = {"{}<Left>", "add brackets on insetion mode"},
    -- ["<A-]>"] = {"}", "add finaly brackets on insetion mode"},
    -- ["<A-a>"] = {"<Esc><right><Delete>i"},

    -- ["<A-q>"] = {"<Esc>", "esc key"},
  },

  n = {

  --Save
    ["<A-s>"] = {"<cmd>w!<CR>"},

  --Move Lines
    ["<S-n>"]= {"<S-v>xp", "move line to down"},
    ["<S-m>"]= {"<S-v>xk<S-p>", "move line to up"},

  --Restoration
    ["<A-r>"] = {"<C-r>", "undo restore"},
    ["<A-f>"] = {"<cmd>HopWord<CR>", "undo restore"},

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
    ["<S-o>"] = {"<C-w>-", "move current split to down"},
    ["<S-p>"] = {"<C-w>+", "move current split to up"},

  --Navigation
    ["f"] = {"<END>", "navigate to end of line"},
    ["ff"] = {"<HOME>", "navigate to beggining of line"},
    ["<A-c>"] = {"<cmd>HopWord<CR>"},
    ["<A-a>"] = {"<cmd>HopAnywhere<CR>"},

  --Navigation between splits
    ["<A-j>"] = { "<C-w>h", "Window left" },
    -- ["<A-l>"] = { "vim.fn.tabpagewinnr(0) == 1 || vim.fn.tabpagewinnr(0, '$') == 1 ? l :<cmd>TmuxNavigateLeft<CR> ", "Window right | <cmd>TmuxNavigateLeft<CR>" },
    ["<A-l>"] = { "<C-w>l", "Window right"},
    ["<A-h>"] = { "<C-w>j", "Window down"},
    ["<A-k>"] = { "<C-w>k", "Window up" },

    --Tmux
    ["<C-l>"] = {"<cmd>TmuxNavigateLeft<CR>"},
    ["<C-h>"] = {"<cmd>TmuxNavigateRight<CR>"},
    ["<C-k>"] = {"<cmd>TmuxNavigateDown<CR>"},
    ["<C-j>"] = {"<cmd>TmuxNavigateUp<CR>"},

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
    ["<A-b>"] = {"<S-v>yp", "copy line below"},

  --Navbuddy
    ["<leader>s"] = { "<cmd>Navbuddy<CR>", "Navbuddy Toggle" },

  --ZenMode
    ["<leader>fz"] = {"<cmd>ZenMode<CR>"},

  --Command mode
    [";"] = { ":", "enter command mode"},
    ["<A-q>"] = {"<Esc>", "esc key"},

  --Deletes remapping
    ["dm"] = {"dw"},
    ["dn"] = {"db"},
    ["df"] = {"d$"},

  --Hop Configuration
    ["<leader>kk"] = {"<cmd>HopWord<CR>"},
    ["<leader>kj"] = {"<cmd>HopAnywhere<CR>"},

  --Telescope
    ["<leader><leader>"] = {"<cmd>Telescope find_files<CR>"},
    ["<leader>fm"] = {"<cmd>Format<CR>"},
    -- ["<leader>fp"] = {"<cmd>Telescope jumplist<CR>"},
    -- ["<leader>fn"] = {"<cmd>Telescope marks<CR>"},
    ["<leader>d"] = {"<cmd>Telescope oldfiles<CR>"},
    ["<leader>j"] = {"<cmd>Telescope file_browser<CR>"},
    ["<leader>l"] = {"<cmd>Telescope zoxide list<CR>"},
    ["<leader>["] = {"<cmd>Telescope notify<CR>"},
    ["<leader>pp"] = {"<cmd>Telescope package_info<CR>"},

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
    ["<leader>gd"] = {"<cmd>LazyGit<CR>"},


  --Octo

    ["<leader>gh"] = {"<cmd>Octo actions<CR>", "help command of Octo"},

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
    ["gpd"] = {"<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "goto definition"},
    ["<S-d>"] = {"<cmd>lua require('goto-preview').goto_preview_references()<CR>", "goto reference"},
    ["gpi"] = {"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "goto implementation"},
    ["gpf"] = {"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "goto type"},
    ["gpm"] = {"<cmd>lua require('goto-preview').goto_preview_declaration()<CR> ", "goto declaration"},
    ["<A-w>"] = {"<cmd>lua require('goto-preview').close_all_win()<CR>", "close goto tabs"},

  --Database
    ["<leader>q"] = {"<cmd>DBUIToggle<CR>"},

  -- Undo
    ["<C-z>"] = {"<cmd>UndotreeToggle<CR>"},


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
    ["<A-n>"] = {"<C-b>"},
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
    ["<leader>]"] = {"<cmd>NvimTreeToggle<CR>", "Toggle nvimtree"}
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

M.dap = {
  plugin = true,
  n = {
    ["<leader>af"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>ac"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    }
  },
}

-- M.lsp = {
--   n = {
--     ["<leader>fm"] = {
--
--       function()
--         require("conform").format()
--       end,
--       "format with conform",
--     },
--   },
-- }

return M
