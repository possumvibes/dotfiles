--------------
-- init.lua --
--------------

-- How To Update This File With Chezmoi
-- 1. cme .config/nvim/init.lua
-- 2. Write changes 
-- 3. IN A SEPARATE TERMINAL INSTANCE (or after :wq):
--    a. call cmap to apply changes
--    b. open a new nvim instance
--    c. run `:source $MYVIMRC` to reload init.lua
-- 4. Return to editing instance, if not complete.

-- The nvim instance will not pick up the changes
-- because the actual init.lua change happens through chezmoi
-- so the fastest way to get the package sync to happen
-- is to use a separate terminal

------------------------
---- Import Modules ----
------------------------
require('plugins')

-------------------
---- Settings! ----
-------------------

-- Set Leader key first thing!
vim.g.mapleader = ' '       -- LEADER is SPACE!

vim.keymap.set('n', '<leader>a', '<cmd>keepjumps normal! ggVG<cr>', {desc = 'Select all'})
vim.keymap.set('n', '<leader>q', ':source $MYVIMRC<cr>', {desc = 'Reload config, sync plugins'})
vim.keymap.set('n', '<leader>qq', '<cmd>source $MYVIMRC | PackerSync<cr>', {desc = 'Reload config, sync plugins'})
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('n', '<leader>x', '<cmd>NvimTreeToggle<cr>', {desc = 'Toggle Explorer'})

-- Appearance/Behavior
vim.opt.number = true       -- show line numbers
vim.opt.ignorecase = true   -- ignore uppercase in searches
vim.opt.smartcase = true    -- ...unless there's a capital in the search phrase

vim.opt.wrap = true         -- long lines wrap
vim.opt.breakindent = true  -- wrapped lines keep the real line's indent

vim.opt.tabstop = 2         -- tab size
vim.opt.shiftwidth = 2      -- line indentation tab (same as tab)
vim.opt.expandtab = true    -- expands tabs to spaces

vim.opt.splitbelow = true   -- default hsplit is below active window
vim.opt.splitright = true   -- default vsplit is right of active window
vim.opt.termguicolors = true -- truly no idea but it's important for at least one plugin and general rendering?

-- Vibes (namely, plugins) 
vim.cmd.colorscheme 'catppuccin'

require('Comment').setup()

require('nvim-tree').setup()

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,

      lookahead = true
    }
  }
})


require('lualine').setup({
  options = {
    theme = 'catppuccin'
  }
})



