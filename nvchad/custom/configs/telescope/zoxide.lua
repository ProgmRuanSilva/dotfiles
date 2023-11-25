local z_utils = require("telescope._extensions.zoxide.utils")
local builtin = require('telescope.builtin')

require('telescope').setup{
  extensions = {
    zoxide = {
      prompt_title = "[ Apps List ]",

      -- Zoxide list command with score
      list_command = "zoxide query -ls",
      mappings = {
        default = {
          action = function(selection)
            vim.cmd.tcd(selection.path)
          end,
          after_action = function(selection)
            print("Directory changed to " .. selection.path)
          end
        },
        ["<C-s>"] = { action = z_utils.create_basic_command("split") },
        ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
        ["<C-e>"] = { action = z_utils.create_basic_command("edit") },
        ["<C-b>"] = {
          keepinsert = true,
          action = function(selection)
            builtin.file_browser({ cwd = selection.path })
          end
        },
        ["<C-f>"] = {
          keepinsert = true,
          action = function(selection)
            builtin.find_files({ cwd = selection.path })
          end
        },
        ["<C-t>"] = {
          action = function(selection)
            vim.cmd.tcd(selection.path)
          end
        },
      }
    }
  }
}
