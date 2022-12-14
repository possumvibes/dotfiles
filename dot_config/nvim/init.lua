------------------------
-- Ye Olde (Neo)Vimrc --
------------------------

------------------------
---- Import Modules ----
------------------------
require('plugins')

-------------------
---- Settings! ----
-------------------

-- Set Leader key first thing!
vim.g.mapleader = ','       

-- Window navigation
vim.keymap.set('n', '<leader>s', '<cmd>wincmd h<cr>', {desc = 'window: left'})
vim.keymap.set('n', '<leader>t', '<cmd>wincmd j<cr>', {desc = 'window: down'})
vim.keymap.set('n', '<leader>d', '<cmd>wincmd k<cr>', {desc = 'window: up'})
vim.keymap.set('n', '<leader>h', '<cmd>wincmd l<cr>', {desc = 'window: right'})
vim.keymap.set('n', '<leader>\'', '<cmd>wincmd w<cr>', {desc = 'window: next'})

vim.keymap.set('n', '<leader>m', '<cmd>NvimTreeFocus<cr>', {desc = 'Reload config, sync plugins'})
vim.keymap.set('n', '<leader>mh', '<cmd>NvimTreeToggle<cr>', {desc = 'Reload config, sync plugins'})
vim.keymap.set('n', '<leader>v', ':source $MYVIMRC<cr>', {desc = 'Reload config, sync plugins'})
vim.keymap.set('n', '<leader>vp', '<cmd>source $MYVIMRC | PackerSync<cr>', {desc = 'Reload config, sync plugins'})
vim.keymap.set('n', '<leader>x', '<cmd>NvimTreeToggle<cr>', {desc = 'Toggle Explorer'})

-- vim.keymap.set("i", '<C-S>', '<cmd>write<cr>')
vim.keymap.set("n", '<C-S>', '<cmd>write<cr>')
vim.keymap.set("i", '<C-S>', '<c-o>:update<cr>')

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

require('nvim-tree').setup()

require('mini.comment').setup({
  mappings = {
    -- changing comment from gc to mc
    comment = 'mc',
    comment_line = 'mcc',
    textobject = 'mc' 
  }
})
require('mini.fuzzy').setup()
require('mini.indentscope').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.tabline').setup()

require('colorizer').setup()

require('nvim-treesitter.configs').setup({

  -- Parsers to auto-install
  ensure_installed = {"bash", "c", "fish", "diff", "lua"},
  sync_install = false, 

  -- highlight module
  highlight = {
    enable = true
  },

  -- textobjects module
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

