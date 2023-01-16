------------------------
-- Ye Olde (Neo)Vimrc --
------------------------

-- use vim's built-in plugins
vim.cmd[[
  set nocompatible
  filetype plugin on
]]

-- Appearance/Behavior
vim.opt.number = true         -- show line numbers
vim.opt.ignorecase = true     -- ignore uppercase in searches
vim.opt.smartcase = true      -- ...unless there's a capital in the search phrase

vim.opt.wrap = true           -- long lines wrap
vim.opt.breakindent = true    -- wrapped lines keep the real line's indent

vim.opt.tabstop = 2           -- tab size
vim.opt.shiftwidth = 2        -- line indentation tab (same as tab)
vim.opt.expandtab = true      -- expands tabs to spaces

vim.opt.splitbelow = true     -- default hsplit is below active window
vim.opt.splitright = true     -- default vsplit is right of active window

vim.opt.showmode = false      -- Hide default mode indicator
vim.opt.termguicolors = true  -- Use true color in terminal

-- set leader before loading plugins
vim.g.mapleader = ','

-- load plugins
require('config.lazy')

-- and the autocommands
require('config.autocmds')

-- load the rest of the keybinds
require('keybinds')


