local cmp = require("cmp")
  local mappings = {

    ["<A-j>"] = cmp.mapping.confirm({ select = true }),
    ["<A-q>"] = cmp.mapping.close({ select = true}),

    ["<A-m>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<A-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),

    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
  }

  -- Use buffer source for `/`.
  cmp.setup.cmdline("/", {
    preselect = "none",
    completion = {
      completeopt = "menu,preview,menuone,noselect",
    },
    mapping = mappings,
    sources = {
      { name = "buffer" },
    },
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
  })

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(":", {
    preselect = "none",
    completion = {
      completeopt = "menu,preview,menuone,noselect",
    },
    mapping = mappings,
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
  })
