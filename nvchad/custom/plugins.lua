--@type NvPluginSpec
local overrides = require "custom.configs.overrides"

local plugins = {
-- Defaults
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
          -- "numToStr/Comment.nvim",
          -- "nvim-telescope/telescope.nvim",
        },
        opts = {
          lsp = { auto_attach = true },
        },
        setup = function()
          require"custom.configs.navbuddy"
        end,
      },

      {
        "jose-elias-alvarez/null-ls.nvim",
        ft = "go",
        opts = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "custom.configs.lspconfig"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.nvimcmp,

    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
          -- load default luasnip config
          require("plugins.configs.others").luasnip(opts)

          local luasnip = require "luasnip"
          luasnip.filetype_extend("javascriptreact", { "html" })
          luasnip.filetype_extend("typescriptreact", { "html" })
          require("luasnip/loaders/from_vscode").lazy_load()
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function ()
      require "custom.configs.lint"
    end
  },

  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function ()
      return require"custom.configs.formatter"
    end
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },


  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

-- Telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim" },
    config = function ()
      require"custom.configs.telescope.file-browser"
    end
  },

  {
    "jvgrootveld/telescope-zoxide",
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/popup.nvim" },
    config = function ()
      require"custom.configs.telescope.zoxide"
    end
  },

  {
    "lpoto/telescope-docker.nvim",
    event = {"VimEnter"},
    config = function ()
      require"custom.configs.telescope.docker"
    end
  },

  {
    "olacin/telescope-gitmoji.nvim",
    event = {"VeryLazy"},
    config = function ()
      require"custom.configs.telescope.gitmoji"
    end
  },

  {
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
  },

  --Text Edition
  {
    "max397574/better-escape.nvim",
    event = {"VimEnter"},
    config = function()
      require"custom.configs.better_escape"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = {"VimEnter"},
    config = function()
      require"custom.configs.autotag"
    end,
  },

  {
    "Wansmer/treesj",
    event = {"VimEnter"},
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {
        use_default_keymaps = false,
      }
    end,
  },

  {
    "MunifTanjim/prettier.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("custom.configs.prettier")
    end
  },

  {
    "mg979/vim-visual-multi",
    event = {"VimEnter"},
    enabled = true,
  },

  {
    "mattn/emmet-vim",
    event = {"VimEnter"},
    enabled = true,
  },

  -- Navigation

 {
  'rmagatti/goto-preview',
    event = "VeryLazy",
    config = function()
      require('goto-preview').setup {
        width = 120;                                        -- Width of the floating window
        height = 15;                                        -- Height of the floating window
        border = {"↖", "─" ,"╮", "│", "╯", "─", "╰", "│"};  -- Border characters of the floating window
        default_mappings = false;
        debug = false;                                      -- Print debug information
        opacity = nil;                                      -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false;                          -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil;                               -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = {                                      -- Configure the telescope UI for slowing the references cycling window.
          telescope = require("telescope")
        };
        focus_on_open = true;                               -- Focus the floating window when opening it.
        dismiss_on_move = true;                             -- Dismiss the floating window when moving the cursor.
        force_close = true,                                 -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe",                                 -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true,              -- Whether to nest floating windows
        preview_window_title = { enable = true, position = "left" }, -- Whether
      }
    end
  },

  {
    "karb94/neoscroll.nvim",
    event = {"VeryLazy"},
    config = function()
      require "custom.configs.neoscroll"
    end,
  },

  {
    "phaazon/hop.nvim",
     event = {"VimEnter"},
    config = function()
      require"custom.configs.hop"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
  },

  -- Visual
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zenmode"
    end,
  },


  {
    "nvim-lua/plenary.nvim",
    event = {"VimEnter"}
  },


  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        --We need configurate on surround file
      })
    end
  },

  {
    "hrsh7th/cmp-buffer",
    event = "VeryLazy",
    config = function ()
    end
  },

  {
    "hrsh7th/cmp-cmdline",
    event = "VeryLazy",
    config = function ()
      require"custom.configs.cmp"
    end
  },

  {
    "itchyny/vim-cursorword",
    event = "VeryLazy",
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function ()
      require"custom.configs.noice"
    end
  },

  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },

  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
  },

  {
    "David-Kunz/gen.nvim",
    event = "VeryLazy",
  },

  {
    "vuki656/package-info.nvim",
    event = "VeryLazy",
    config = function ()
      require('package-info').setup()
    end
  },

  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function ()
      vim.keymap.set('i', '<A-i>', function () return vim.fn['codeium#Accept']() end, { expr = true })
      -- vim.keymap.set('i', '<A-[>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<A-]>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<A-[>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },

  -- {
  --   "glepnir/dashboard-nvim",
  --   event = {"VimEnter"},
  --   dependencies = {"nvim-tree/nvim-web-devicons"},
  --   config = function()
  --     require"custom.configs.dashboard"
  --   end,
  -- },

-----------------
--- TEST AREA----
-----------------

  {
    "nvim-telescope/telescope-dap.nvim",
    event = {"VimEnter"},
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },

  {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("custom.configs.dadbod").setup()
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    event = "VeryLazy",
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },


}
return plugins
