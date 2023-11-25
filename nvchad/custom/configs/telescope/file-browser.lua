local fb_actions = require "telescope._extensions.file_browser.actions"
local fb_utils = require("telescope._extensions.file_browser.utils")
local action_state = require("telescope.actions.state")

require("telescope").setup {
  extensions = {
    file_browser = {
      path = vim.loop.cwd(),
      cwd = vim.loop.cwd(),
      cwd_to_path = false,
      grouped = true,
      files = true,
      add_dirs = true,
      depth = 3,
      auto_depth = false,
      select_buffer = false,
      hidden = { file_browser = false, folder_browser = false },
      respect_gitignore = vim.fn.executable "fd" == 1,
      follow_symlinks = false,
      browse_files = require("telescope._extensions.file_browser.finders").browse_files,
      browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
      hide_parent_dir = false,
      collapse_dirs = false,
      prompt_path = false,
      quiet = true,
      dir_icon = "",
      dir_icon_hl = "Default",
      display_stat = { date = false, size = false, mode = false},
      hijack_netrw = true,
      use_fd = true,
      git_status = true,
      mappings = {
        ["i"] = {
          ["<A-c>"] = fb_actions.create,
          ["<S-CR>"] = fb_actions.create_from_prompt,
          ["<A-r>"] = fb_actions.rename,
          ["<A-m>"] = fb_actions.move,
          ["<A-y>"] = fb_actions.copy,
          ["<A-d>"] = fb_actions.remove,
          ["<C-o>"] = fb_actions.open,
          ["<A-h>"] = fb_actions.goto_parent_dir,
          ["<C-e>"] = fb_actions.goto_home_dir,
          ["<C-w>"] = fb_actions.goto_cwd,
          ["<C-t>"] = fb_actions.change_cwd,
          ["<A-f>"] = fb_actions.toggle_browser,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["<C-s>"] = fb_actions.toggle_all,
          ["<bs>"] = fb_actions.backspace,
          ["<A-g>"] = function(prompt_bufnr)
            local selections = fb_utils.get_selected_files(prompt_bufnr, false)
            local search_dirs = vim.tbl_map(function(path) return path:absolute() end, selections)
            if vim.tbl_isempty(search_dirs) then
              local current_finder = action_state.get_current_picker(prompt_bufnr).finder
              search_dirs = { current_finder.path }
            end
            fb_actions.close(prompt_bufnr)
            require("telescope.builtin").live_grep({ search_dirs = search_dirs })
          end,
        },
        ["n"] = {
          ["c"] = fb_actions.create,
          ["a"] = fb_actions.create,
          ["f"] = fb_actions.create,
          ["r"] = fb_actions.rename,
          ["m"] = fb_actions.move,
          ["y"] = fb_actions.copy,
          ["d"] = fb_actions.remove,
          ["o"] = fb_actions.open,
          ["g"] = fb_actions.goto_parent_dir,
          ["e"] = fb_actions.goto_home_dir,
          ["w"] = fb_actions.goto_cwd,
          ["t"] = fb_actions.change_cwd,
          ["b"] = fb_actions.toggle_browser,
          ["h"] = fb_actions.toggle_hidden,
          ["s"] = fb_actions.toggle_all,
        },
      },
    },
  },
}
