local null_ls = require "null-ls"

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local opts = {
  sources = {

    format.gofumpt,
    format.goimports_reviser,
    format.golines,

    --Deno
    format.deno_fmt,

    --Prettier
    format.prettier.with { filetypes = { "html", "markdown", "css" } },

    --Lua
    format.stylua,

    --Shell
    format.shfmt,
    lint.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

    --C++
    format.clang_format,

    --Ruby
    lint.rubocop,
    format.rubocop,
    format.rubyfm,

    --Html
    format.htmlbeautifier,

    --Yaml
    format.yamlfmt,
  },
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
