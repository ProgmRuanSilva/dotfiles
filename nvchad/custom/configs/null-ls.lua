local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lint = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local opts = {
  sources = {

    formatting.gofumpt,
    formatting.goimports_reviser,
    formatting.golines,

    --Deno
    formatting.deno_fmt,

    --Prettier
    -- formatting.prettier,

    --Lua
    formatting.stylua,

    --Shell
    formatting.shfmt,
    lint.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

    --C++
    formatting.clang_format,

    --Ruby
    lint.rubocop,
    formatting.rubocop,

    --Html
    formatting.htmlbeautifier,

    --Yaml
    formatting.yamlfmt,
  },
  -- on_attach = function(client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format({ bufnr = bufnr })
  --       end,
  --     })
  --   end
  -- end,
}

  --not working
  -- on_attach = function (client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --   vim.api.nvim_clear_autocmds({
  --     group = augroup,
  --     buffer = bufnr,
  --   })
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function ()
  --         vim.lsp.buf.format({bufnr = bufnr})
  --       end
  --     })
  --   end
  -- end,



return opts
