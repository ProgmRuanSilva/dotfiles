local autocmd = vim.api.nvim_create_autocmd

-- Replace string from file
function sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
end

-- Split Alternation
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

for j = 1, 9, 1 do
  vim.keymap.set("n", string.format("<C-%s>", j), function()
    vim.cmd "tabN[j]"
  end)
end

-- Autoformat
vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.scss,*.md,*.html,*.yaml",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !black --quiet %")
            vim.cmd("Prettier")
        end,
    }
)
-- -- Define a variable for the key
-- local l = "l"
--
-- -- Define a Lua function for the conditional mapping
-- function ConditionalMapping()
--     -- Check if there is a split in the current window
--     local isSplit = vim.fn.tabpagewinnr(0) > 1 or vim.fn.tabpagewinnr(0, '$') > 1
--
--     -- Choose the command based on the split condition
--     local command = isSplit and ":TmuxNavigateLeft<CR>" or "" .. l
--
--     -- Execute the chosen command
--     return vim.cmd(command)
-- end
--
-- -- Set the keymap in Lua
-- vim.api.nvim_set_keymap('n', string.format('<A-%s>', l), ':lua ConditionalMapping()<CR>', { noremap = true, silent = true })




-- Window Alternation
-- for i = 1, 9, 1 do
--   vim.keymap.set("n", string.format("<leader-%s>", i), function()
--    tabd(i)
--   end)
-- end

-- for i=0,9 do
--   vim.keymap.set("n", string.format("<A-%s>", i), function ()
--       vim.cmd(":lua tabn(i)")
--     end)
-- end

-- Tab Resize
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

--
-- -- reloads xresources for current focused window onl
-- local function liveReload_xresources()
--   vim.cmd "silent !xrdb -merge ~/.Xresources"
--   vim.cmd "silent !kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"
-- end
--
--
-- -- Dynamic terminal padding with/without nvim (for siduck's st only)
-- autocmd({ "BufNewFile", "BufRead" }, {
--   callback = function(ctx)
--     -- remove terminal padding
--     -- keep padding when nvim has only 1 buffer
--
--     if #vim.fn.getbufinfo { buflisted = 1 } > 1 then
--       sed("st.borderpx: 20", "st.borderpx: 0", "~/.Xresources")
--       liveReload_xresources()
--
--       -- revert xresources change but dont reload it
--       sed("st.borderpx: 0", "st.borderpx: 20", "~/.Xresources")
--
--       vim.cmd "silent !xrdb -merge ~/.Xresources"
--       vim.api.nvim_del_autocmd(ctx.id)
--     end
--   end,
-- })
--
-- -- add terminal padding
-- autocmd("VimLeavePre", {
--   callback = function()
--     sed("st.borderpx: 0", "st.borderpx: 20", "~/.Xresources")
--     liveReload_xresources()
--   end,
-- })
