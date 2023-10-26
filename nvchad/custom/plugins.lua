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
    "rmagatti/goto-preview",
    event = {"VeryLazy"},
    enabled = true,
    config = function()
      require"custom.configs.goto"
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = {"VimEnter"},
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
    "mfussenegger/nvim-dap",
    event = { "VeryLazy" },
  },

  {
    "nvim-telescope/telescope-dap.nvim",
    event = {"VimEnter"},
  },

  { --under tests
    "sindrets/diffview.nvim",
    event = {"VeryLazy"},
  },

}
return plugins
