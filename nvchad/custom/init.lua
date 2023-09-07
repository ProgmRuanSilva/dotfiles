require "custom.autocmds"

-- Init Overwrites
local opt = vim.opt

opt.number = false

-- Packer nvim
require('packer').startup(function (use)

  use 'wbthomason/packer.nvim'

  use {
      "SmiteshP/nvim-navbuddy",
      requires = {
          "neovim/nvim-lspconfig",
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
          "numToStr/Comment.nvim",
      }
  }

  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup { default_mappings = true }
    end
  }
  end)
