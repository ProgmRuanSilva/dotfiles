local overrides = require "custom.configs.overrides"
local cmp = require "cmp"

--@type NvPluginSpec[]
local plugins = {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        event = { "VimEnter" },
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
    end, -- Override to setup mason-lspconfig
  },

  {
    "wbthomason/packer.nvim",
    enabled = true,
    lazy = false,
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
    "max397574/better-escape.nvim",
    event = "VimEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!)
    build = "make install_jsregexp",
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "VimEnter" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "Wansmer/treesj",
    keys = { "<space>m" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {}
    end,
  },

  {
    "karb94/neoscroll.nvim",
    -- keys = { "q", "w" },
    event = { "VimEnter" },
    config = function()
      require "custom.configs.neoscroll"
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zenmode"
    end,
  },

  --Vim Plugins
  {
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
  },
  {
    "mg979/vim-visual-multi",
    event = { "VimEnter" },
    enabled = true,
  },

  {
    "francoiscabrol/ranger.vim",
    cmd = "Ranger",
  },

  {
    "mattn/emmet-vim",
    event = { "VimEnter" },
    enabled = true,
  },

  {
    "rmagatti/goto-preview",
    event = { "VimEnter" },
    enabled = true,
    config = function()
      require("goto-preview").setup { default_config = true }
    end,
  },

  --Overwrites
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        initial_mode = "normal",
        mappings = {
          n = {
            ["o"] = require("telescope.actions").file_edit,
            ["<A-j>"] = require("telescope.actions").file_edit,
          },
        },
      },
    },
  },

  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        theme = "hyper",
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              desc = " Apps",
              group = "DiagnosticHint",
              action = "Telescope app",
              key = "a",
            },
            {
              desc = " dotfiles",
              group = "Number",
              action = "Telescope dotfiles",
              key = "d",
            },
          },
        },
      }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "NvChad/nvterm",
    require("nvterm").setup {
      terminals = {
        type_opts = {
          float = {
            relative = "editor",
            row = 0.09,
            col = 0.22,
            width = 0.55,
            height = 0.75,
            border = "single",
          },
        },
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {

      mapping = {
        ["<A-k>"] = cmp.mapping.select_prev_item(),
        ["<A-j>"] = cmp.mapping.select_next_item(),
        ["<A-l>"] = cmp.mapping.close(),
        ["<A-h>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
      },

      sources = {
        { name = "nvim_lsp", trigger_characters = { "-" } },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    },
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
}

return plugins
