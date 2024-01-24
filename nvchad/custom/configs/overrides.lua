local M = {}
local cmp = require'cmp'

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

M.telescope = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.50,
        results_width = 0.10,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {

        --Moviment
        ["<A-k>"] = require("telescope.actions").move_selection_next,
        ["<A-l>"] = require("telescope.actions").move_selection_previous,
        ["<A-j>"] = require("telescope.actions").select_default,

        --Splits
        ["<A-w>"] = require("telescope.actions").file_vsplit,
        ["<A-e>"] = require("telescope.actions").file_split,

        --Preview View
        -- ["<A-w>"] = require("telescope.actions").results_scrolling_up,
        -- ["<A-e>"] = require("telescope.actions").results_scrolling_down,

        ["<A-m>"] = require("telescope.actions").preview_scrolling_down,
        ["<A-n>"] = require("telescope.actions").preview_scrolling_down,

        --Edit
        ["<A-q>"] = require("telescope.actions").close,

        ["<A-a>"] = require("telescope.actions").toggle_all,

      },

      n = {
        --Edition
        ["j"] = require("telescope.actions").select_default,
        ["<A-j>"] = require("telescope.actions").select_default,

        --Moviment
        ["k"] = require("telescope.actions").move_selection_next,
        ["l"] = require("telescope.actions").move_selection_previous,

        --Splits
        ["<A-w>"] = require("telescope.actions").file_vsplit,
        ["<A-e>"] = require("telescope.actions").file_split,

        --Preview View
        ["<A-n>"] = require("telescope.actions").preview_scrolling_up,
        ["<A-m>"] = require("telescope.actions").preview_scrolling_down,

        --Git
        ["<A-c>"] = require("telescope.actions").git_create_branch,

        --Exit
        ["q"] = require("telescope.actions").close,
        ["<A-q>"] = require("telescope.actions").close,
      },
    },
  },
  extensions_list = { "themes", "terms", "docker", "gitmoji" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

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
    "unocss-language-server",
    "eslint-lsp",
    "deno",
    "prettier",
    "json-lsp",

    "clangd",
    "clang-format",

    "gopls",

    "shfmt",
    "shellcheck",
    "bash-language-server",
  },
}

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
    shell = vim.o.shell,
    type_opts = {
      float = {
        relative = "editor",
        row = 0.12,
        col = 0.20,
        width = 0.65,
        height = 0.9,
        border = "rounded",
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
      { name = "hrsh7th/cmp-nvim-lsp" },
      { name = "L3MON4D3/LuaSnip" },
      { name = "saadparwaiz1/cpm_luasnip" },
      { name = "Exafunction/codeium.vim" },
    },
    experimental = {
      ghost_text = true,
    },
  }


return M
