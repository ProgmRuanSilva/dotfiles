local config = require "plugins.configs.lspconfig"
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local on_attach = config.on_attach
local capabilities = config.capabilities

lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { ".tsx", ".ts", ".js", ".mjs", ".cjs" },
  root_dir = util.root_pattern(".eslintignore", ".eslintrc.mjs", ".eslintrc.cjs"),
  init_options = {
    preferences = {
      disableSuggestions = false,
    },
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = false,
    },
  },
}

lspconfig.pylint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { ".py" },
}

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 100,
        },
      },
    },
  },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go_work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
