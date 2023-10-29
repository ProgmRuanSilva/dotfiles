--@type NvPluginSpec
local overrides = require "custom.configs.overrides"

local plugins = {
-- Defaults
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        event = {"VeryLazy"},
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
          "numToStr/Comment.nvim",
          "nvim-telescope/telescope.nvim",
        },
        opts = {
          lsp = { auto_attach = true },
        },
        setup = function ()
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
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
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
      return require "custom.configs.formatter"
    end
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },


  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.nvimcmp,
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

  {
    "pwntester/octo.nvim",
    event = {"VimEnter"},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      require"custom.configs.telescope.octo"
    end
  },

  --Text Edition
  {
    "max397574/better-escape.nvim",
    event = {"VimEnter"},
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = {"VimEnter"},
    config = function()
      require("nvim-ts-autotag").setup{
        autotag = {
          enable = true,
        }
      }
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
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 15; -- Height of the floating window
        border = {"↖", "─" ,"╮", "│", "╯", "─", "╰", "│"}; -- Border characters of the floating window
        default_mappings = false;
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
        };
        focus_on_open = true; -- Focus the floating window when opening it.
        dismiss_on_move = true; -- Dismiss the floating window when moving the cursor.
        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true, -- Whether to nest floating windows
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
      })
    end
  },

  {
    "hrsh7th/cmp-cmdline",
    event = "VeryLazy",
    config = function ()
      require"custom.configs.cmd"
    end
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
    "glepnir/dashboard-nvim",
    event = {"VimEnter"},
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require"custom.configs.dashboard"
    end,
  },

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

  { --under tests
    "sindrets/diffview.nvim",
    event = {"VeryLazy"},
  },

  {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("configs.dadbod").setup()
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    event = "VeryLazy",
  },


  {
    "kristijanhusak/vim-dadbod-completion",
    event = "VeryLazy",
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
  --   event = "VimEnter",
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
