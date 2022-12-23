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
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set Leader key first thing!
vim.g.mapleader = ','       

-- Window navigation
vim.keymap.set('n', '<leader>s', '<cmd>wincmd h<cr>', {desc = 'window: left'})
vim.keymap.set('n', '<leader>t', '<cmd>wincmd j<cr>', {desc = 'window: down'})
vim.keymap.set('n', '<leader>d', '<cmd>wincmd k<cr>', {desc = 'window: up'})
vim.keymap.set('n', '<leader>h', '<cmd>wincmd l<cr>', {desc = 'window: right'})
vim.keymap.set('n', '<leader>\'', '<cmd>wincmd w<cr>', {desc = 'window: next'})

vim.keymap.set("n", '<C-H>', '<C-W>')
vim.keymap.set("n", '<C-H>h', '<C-W>w')

vim.keymap.set('n', '<leader>m', '<cmd>NvimTreeFocus<cr>', {desc = 'focus nvimTree'})
vim.keymap.set('n', '<leader>mh', '<cmd>NvimTreeToggle<cr>', {desc = 'toggle nvimTree'})
vim.keymap.set('n', '<leader>v', ':source $MYVIMRC<cr>', {desc = 'Reload config, sync plugins'})
vim.keymap.set('n', '<leader>vp', '<cmd>source $MYVIMRC | PackerSync<cr>', {desc = 'Reload config, sync plugins'})
vim.keymap.set('n', '<leader>x', '<cmd>NvimTreeToggle<cr>', {desc = 'Toggle Explorer'})

vim.keymap.set('n', 'Y', 'yy', {desc = "Y behaves consistently with C and D"})
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
vim.cmd.colorscheme 'catppuccin' --  Catppuccin mocha my beloved

require('nvim-tree').setup() -- File Explorer tree

-- mini library: Using A Bunch Of 'Em
-- comments babyyyyyy may yet replace this if i can't set comment symbols for additional languages
require('mini.comment').setup({
  mappings = {
    -- default mapping is a line-jump SFB so leader key it is!
    comment = '<leader>c',
    comment_line = '<leader>cc',
    textobject = '<leader>c' 
  }
})
require('mini.completion').setup() -- autocompletion.
-- require('mini.fuzzy').setup() -- may be useful with telescope, if i install that
require('mini.indentscope').setup() -- visual of the current indent-scope
require('mini.pairs').setup() -- AUTOPAIRING BAYBEYYYYYY
-- require('mini.status').setup() -- under consideration for ide-like purposes
require('mini.surround').setup() -- surround objects/selections with brackets/quotes
require('mini.tabline').setup() -- moveable tab line of all open tabs.

require('colorizer').setup() -- highlights hex codes with the color

-- nvim treesitter! i still don't understand what this does but i like syntax highlighting :)
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

-- status bar because #aestheticOrDeath
require('lualine').setup({
  options = {
    theme = 'catppuccin'
  }
})

