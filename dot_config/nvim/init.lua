------------------------
-- Ye Olde (Neo)Vimrc --
------------------------

-- use vim's built-in plugins
vim.cmd[[
  set nocompatible
  filetype plugin on
]]

-- Appearance/Behavior
local opt = vim.opt

opt.number = true         -- show line numbers
opt.ignorecase = true     -- ignore uppercase in searches
opt.smartcase = true      -- ...unless there's a capital in the search phrase
opt.wrap = true           -- long lines wrap
opt.breakindent = true    -- wrapped lines keep the real line's indent
opt.tabstop = 2           -- tab size
opt.shiftwidth = 2        -- line indentation tab (same as tab)
opt.expandtab = true      -- expands tabs to spaces
opt.splitbelow = true     -- default hsplit is below active window
opt.splitright = true     -- default vsplit is right of active window
opt.showmode = false      -- Hide default mode indicator
opt.cursorline = true     -- Highlight line cursor is on
opt.termguicolors = true  -- Use true color in terminal

-- set leader before loading plugins
vim.g.mapleader = ' '

-- load plugins
require('config.lazy')

-- and the autocommands
require('config.autocmds')

-- load the rest of the keybinds
require('keybinds')


