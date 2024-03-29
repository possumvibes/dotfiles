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

-- netrw but make it fancy
vim.g.netrw_liststyle = 3
-- vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1

-- set leader before loading plugins
vim.g.mapleader = ' '

-- load plugins
-- require('config.lazy')
---------------------------------
-- install lazy if not present --
---------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins')

-- and the autocommands
require('autocmds')

-- load the rest of the keybinds
require('keybinds')


