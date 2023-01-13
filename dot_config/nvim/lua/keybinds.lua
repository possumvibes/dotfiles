-------------------
--  Keybindings! --
-------------------

-------------------
---  Leader Key --- 
-------------------
vim.g.mapleader = ','

-- Window navigation
vim.keymap.set('n', '<leader>s', '<cmd>wincmd h<cr>', {desc = 'window: left'})
vim.keymap.set('n', '<leader>t', '<cmd>wincmd j<cr>', {desc = 'window: down'})
vim.keymap.set('n', '<leader>d', '<cmd>wincmd k<cr>', {desc = 'window: up'})
vim.keymap.set('n', '<leader>h', '<cmd>wincmd l<cr>', {desc = 'window: right'})
vim.keymap.set('n', '<leader>\'', '<cmd>wincmd w<cr>', {desc = 'window: next'})
vim.keymap.set('n', '<leader>.', '<C-W>', {desc = 'window'})


-- File explorer
vim.keymap.set('n', '<leader>m', '<cmd>Vexplore<cr>', {desc = 'VSplit Netrw'})
vim.keymap.set('n', '<leader>v', ':source $MYVIMRC<cr>', {desc = 'Reload config'})
vim.keymap.set('n', '<leader>vp', '<cmd>PackerSync<cr>', {desc = 'Sync plugins'})

-- Telescope Pickers
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', builtin.builtin, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>fcc', builtin.command_history, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', builtin.planets, {})


------------------------
---  LSP Diagnostics  ---
------------------------
-- See https://github.com/neovim/nvim-lspconfig/#suggested-configuration
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


--------------------
---  Convenience ---
--------------------
vim.cmd[[
  cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
]]
vim.api.nvim_set_keymap('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })

vim.keymap.set("n", '<F5>', '<cmd>noh<cr>')
vim.keymap.set('n', 'Y', 'yy', {desc = "Y copies the full line"})
vim.keymap.set("n", '<C-S>', vim.cmd.update, { silent = true })
vim.keymap.set("i", '<C-S>', '<c-o>:update<cr>')

