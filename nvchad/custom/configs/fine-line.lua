local fineline = require('fine-cmdline')
local fn = fineline.fn

require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = false,
    smart_history = true,
    prompt = ': '
  },

  popup = {
    position = {
      row = '80%',
      col = '40%',
    },
    size = {
      width = '50%',
    },
    border = {
      style = 'rounded',
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },

  hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      -- code
    end,
    set_keymaps = function(imap, feedkeys)
      imap('<A-j>', '<Enter>')
      imap('<A-q>', fn.close)
    end
  }
})
