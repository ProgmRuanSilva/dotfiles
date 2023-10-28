local cmp = require("cmp")
  local mapping = {
    ["<A-j>"] = cmp.mapping.confirm({ select = true }),
    ["<A-l>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<A-k>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
  }

  -- Use buffer source for `/`.
  cmp.setup.cmdline("/", {
    preselect = "none",
    completion = {
      completeopt = "menu,preview,menuone,noselect",
    },
    mapping = mapping,
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
    mapping = mapping,
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

