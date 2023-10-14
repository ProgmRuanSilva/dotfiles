local M = {}
local cmp = require'cmp'

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5


M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "eslint-lsp",
    "deno",
    "prettier",

    "clangd",
    "clang-format",

    "gopls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },
  view = {
    adaptive_size = false,
    side = "left",
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
      end,
    },
  },

  update_focused_file = {
    update_root = true,
  },

  renderer = {
    root_folder_label = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        row = 0.09,
        col = 0.22,
        width = 0.55,
        height = 0.75,
        border = "single",
      },
    },
  },
}

M.telescope = {
  defaults = {
    initial_mode = "normal",
    mappings = {
      n = {
        ["o"] = require("telescope.actions").file_edit,
        ["<A-j>"] = require("telescope.actions").file_edit,
      },
    },
  },
}

M.nvimcmp = {
    mapping = {
      ["<A-k>"] = cmp.mapping.select_prev_item(),
      ["<A-j>"] = cmp.mapping.select_next_item(),
      ["<A-l>"] = cmp.mapping.close(),
      ["<A-h>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
    },

    sources = {
      { name = "nvim_lsp", trigger_characters = { "-" } },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }


return M
