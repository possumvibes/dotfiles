-------------------
--  Keybindings! --
-------------------

-- Convenience function
local map = vim.keymap.set

-------------------
---  Leader Key --- 
-------------------

-- ensure that leader key original function isn't shadowed
map('n', '\\', ',', { noremap = true})


-- Window navigation
map('n', '<leader>s', '<cmd>wincmd h<cr>', {desc = 'window: left'})
map('n', '<leader>t', '<cmd>wincmd j<cr>', {desc = 'window: down'})
map('n', '<leader>d', '<cmd>wincmd k<cr>', {desc = 'window: up'})
map('n', '<leader>h', '<cmd>wincmd l<cr>', {desc = 'window: right'})
map('n', '<leader>\'', '<cmd>wincmd w<cr>', {desc = 'window: next'})
map('n', '<leader>.', '<C-W>', {desc = 'window'})


-- File explorer
map('n', '<leader>m', '<cmd>Vexplore<cr>', {desc = 'VSplit Netrw'})
map('n', '<leader>v', ':source $MYVIMRC<cr>', {desc = 'Reload config'})
map('n', '<leader>vp', '<cmd>PackerSync<cr>', {desc = 'Sync plugins'})

-- Telescope Pickers
local builtin = require('telescope.builtin')
map('n', '<leader>fa', builtin.builtin, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fc', builtin.commands, {})
map('n', '<leader>fcc', builtin.command_history, {})
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>fp', builtin.planets, {})


------------------------
---  LSP Diagnostics  ---
------------------------
-- See https://github.com/neovim/nvim-lspconfig/#suggested-configuration
local opts = { noremap=true, silent=true }
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)


--------------------
---  Convenience ---
--------------------
vim.cmd[[
  cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
]]
vim.api.nvim_set_keymap('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

map("n", '<F5>', '<cmd>noh<cr>')
map('n', 'Y', 'yy', {desc = "Y copies the full line"})
map("n", '<C-S>', vim.cmd.update, { silent = true })
map("i", '<C-S>', '<c-o>:update<cr>')

