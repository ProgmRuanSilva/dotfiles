local neoscroll = require("neoscroll")
require('neoscroll').setup({
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = function (info)
      if info == "cursorline"
      then
        neoscroll.zz('250')
      end
    end,
    performance_mode = false,
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-d>'] = { 'scroll', {  '-vim.wo.scroll', 'true', '350', 'sine', [['cursorline']] } }
t['w'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}, {'zz', {'250'}}}
t['e'] = {'scroll', { 'vim.wo.scroll', 'true', '250'},{'zt', {'250'}}}
t['<A-w>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
-- t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
-- t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
t['çl']    = {'zt', {'250'}}
t['çj']    = {'zz', {'250'}}
t['çk']    = {'zb', {'250'}}

require("neoscroll.config").set_mappings(t)
