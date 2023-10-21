require('neoscroll').setup()
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['w'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}, {'zz', {'250'}}} -- move to up
t['e'] = {'scroll', { 'vim.wo.scroll', 'true', '250'},{'zt', {'250'}}} -- move to down
t['<A-w>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
t['<A-e>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
-- t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
-- t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
t['fl']    = {'zt', {'250'}}
t['fj']    = {'zz', {'250'}}
t['fk']    = {'zb', {'250'}}
require("neoscroll.config").set_mappings(t)
