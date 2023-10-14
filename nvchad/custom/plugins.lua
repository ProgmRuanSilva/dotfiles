local overrides = require "custom.configs.overrides"

--@type NvPluginSpec
local plugins = {
-- Overrides
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        event = {"VimEnter"},
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = {
          lsp = { auto_attach = true },
        },
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
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },


  {
    "hrsh7th/nvim-cmp",
    opts = overrides.nvimcmp,
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
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
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
  -- {
  --   "rmagatti/goto-preview",
  --   event = {"VimEnter"},
  --   enabled = true,
  --   config = function()
  --     require("goto-preview").setup { default_config = true }
  --   end,
  -- },

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

  {
    "francoiscabrol/ranger.vim",
    cmd = "Ranger",
  },

  --Boadding
  {
    "VonHeikemen/fine-cmdline.nvim",
    event = {"VimEnter"},
    -- dependencies = {'MunifTankim/nui.nvim'},
    config = function ()
      require"custom.configs.fine-line"
    end
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zenmode"
    end,
  },

  {
    "glepnir/dashboard-nvim",
    event = {"VimEnter"},
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require"custom.configs.dashboard"
    end,
  },

  --LLM
  {
    "David-Kunz/gen.nvim",
    event = {"VimEnter"}
  },

  {
    "nvim-lua/plenary.nvim",
    event = {"VimEnter"}
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
      require"custom.configs.octo"
    end
  },

  {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  }

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
}

return plugins
