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
          require "custom.configs.navbuddy"
        end,
      },
    },

    --   {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     ft = "go",
    --     opts = function()
    --       require "custom.configs.null-ls"
    --     end,
    --   },
    -- },
    config = function()
      require "custom.configs.lspconfig"
    end,
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = overrides.nvimcmp,
  --
  --   dependencies = {
  --     {
  --       -- snippet plugin
  --       "L3MON4D3/LuaSnip",
  --       config = function(_, opts)
  --         -- load default luasnip config
  --         require("plugins.configs.others").luasnip(opts)
  --
  --         local luasnip = require "luasnip"
  --         luasnip.filetype_extend("javascriptreact", { "html" })
  --         luasnip.filetype_extend("typescriptreact", { "html" })
  --         require("luasnip/loaders/from_vscode").lazy_load()
  --       end,
  --     },
  --   },
  -- },

  -- {
  --   "mhartington/formatter.nvim",
  --   event = "VeryLazy",
  --   opts = function ()
  --     return require"custom.configs.formatter"
  --   end
  -- },

  -----------------
  --- TEST AREA----
  -----------------

  {
    "nvim-telescope/telescope-dap.nvim",
    event = { "VimEnter" },
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
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
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings "dap"
    end,
  },
}
return plugins
