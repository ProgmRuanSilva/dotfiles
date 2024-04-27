local config = require "plugins.configs.lspconfig"
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local on_attach = config.on_attach
local capabilities = config.capabilities

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

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
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
  init_options = {
    preferences = {
      disableSuggestions = false,
    },
  },
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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

lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "ruby", ".rb", ".erb" },
  root_dir = util.root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      diagnostics = true,
      formatting = true,
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
