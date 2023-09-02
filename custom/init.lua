require "custom.autocmds"

local autocmd = vim.api.nvim_create_autocmd

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

  end)




