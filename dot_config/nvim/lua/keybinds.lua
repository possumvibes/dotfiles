-------------------
--  Keybindings! --
-------------------

-- Convenience function
local map = vim.keymap.set

-------------------
---  Leader Key --- 
-------------------

-- ensure that leader key original function isn't shadowed
map('n', '\\', ' ', { noremap = true})


-- Window navigation
map('n', '<leader>g', '<cmd>write<CR>', {desc = 'write file'})

map('n', '<leader>s', '<cmd>wincmd h<cr>', {desc = 'window: left'})
map('n', '<leader>t', '<cmd>wincmd j<cr>', {desc = 'window: down'})
map('n', '<leader>d', '<cmd>wincmd k<cr>', {desc = 'window: up'})
map('n', '<leader>h', '<cmd>wincmd l<cr>', {desc = 'window: right'})
map('n', '<leader>\'', '<cmd>wincmd w<cr>', {desc = 'window: next'})
map('n', '<leader>.', '<C-W>', {desc = 'window'})

-- Registers
map({'n', 'v'}, '<leader>*', '"*') -- Middle Click register
map({'n', 'v'}, '<leader>-', '"+') -- System Clipboard register
map({'n', 'v'}, '<leader>q', '"_') -- Null register

map({'n', 'v'}, '<C-Insert>', '"+y') -- yank to system clipboard
map({'n', 'v'}, '<S-Del>', '"+d')    -- "cut" to system clipboard
-- <S-Insert> (Paste System Clipboard) is handled by the terminal directly

-- File explorer
map('n', '<leader>m', '<cmd>Vexplore<cr>', {desc = 'VSplit Netrw'})
map('n', '<leader>v', '<cmd>Lazy<cr>', {desc = 'Open lazy.nvim'})
map('n', '<leader>vv', ':source $MYVIMRC<cr>', {desc = 'Source init.lua'})

-- Telescope Pickers
local builtin = require('telescope.builtin')
map('n', '<leader>fa', builtin.builtin, {desc = "telescope builtin picker"})
map('n', '<leader>fb', builtin.buffers, {desc = "telescope buffers picker"})
map('n', '<leader>fc', builtin.commands, {desc = "telescope commands picker"})
map('n', '<leader>fcc', builtin.command_history, {desc = "telescope command_history picker"})
map('n', '<leader>ff', builtin.find_files, {desc = "telescope find_files picker"})
map('n', '<leader>fg', builtin.live_grep, {desc = "telescope {}) picker"})
map('n', '<leader>fh', builtin.help_tags, {desc = "telescope help_tags picker"})
map('n', '<leader>fp', builtin.planets, {desc = "telescope planets picker"})

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

