require("telescope").setup {
  extensions = {
    -- NOTE: this setup is optional
    docker = {
      -- These are the default values
      -- theme = "dropdown",
      binary = "docker", -- in case you want to use podman or something
      compose_binary = "docker compose",
      buildx_binary = "docker buildx",
      machine_binary = "docker-machine",
      log_level = vim.log.levels.INFO,
      init_term = "tabnew", -- "vsplit new", "split new", ...
      -- NOTE: init_term may also be a function that receives
      -- a command, a table of env. variables and cwd as input.
      -- This is intended only for advanced use, in case you want
      -- to send the env. and command to a tmux terminal or floaterm
      -- or something other than a built in terminal.
    },
  },
}
