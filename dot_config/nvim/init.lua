--------------
-- init.lua --
--------------

-- Import Modules
require('plugins')


-- Appearance/Behavior
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true


-- Vibes
vim.cmd.colorscheme 'catppuccin'

require('lualine').setup()


-- Keybindings
-- leader keys
-- vim.g.mapleader = ','
-- vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
-- vim.keymap.set('n', '<leader>a', 'keepjumps normal! ggVG<cr>')
-- 
-- -- add dedicated bindings to copy to system clipboard
-- vim.keymap.set({'n', 'x'}, 'cp', '"+y')
-- vim.keymap.set({'n', 'x'}, 'cv', '"+p')

