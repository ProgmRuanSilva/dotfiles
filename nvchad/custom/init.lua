require "custom.autocmds"
require "custom.commands"

-- Init Overwrites
local opt = vim.opt

opt.number = false
opt.title = true

-- Packer nvim
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup { default_mappings = true }
    end,
  }

end)
