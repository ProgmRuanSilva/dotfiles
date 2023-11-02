require("telescope").setup({
  extensions = {
    gitmoji = {
      action = function(entry)
        -- entry = {
          -- display = "🐛 Fix a bug.",
          -- index = 4,
          -- ordinal = "Fix a bug.",
          -- value = {
            -- description = "Fix a bug.",
            -- text = ":bug:",
            -- value = "🐛"
          -- }
        -- }
        local emoji = entry.value.value
        vim.ui.input({ prompt = "Enter commit message: " .. emoji .. " " }, function(msg)
          if not msg then
            return
          end

        local git_tool = ":!git"
        if vim.g.loaded_fugitive then
          git_tool = ":G"
        end
          vim.cmd(string.format('%s commit -m "%s %s"', git_tool, emoji, msg))
        end)
      end,
    },
  },
})
