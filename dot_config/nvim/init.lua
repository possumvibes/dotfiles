------------------------
-- Ye Olde (Neo)Vimrc --
------------------------

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
vim.opt.termguicolors = true  -- truly no idea but it's important for at least one plugin and general rendering?

-- Autocommands because this vimrc is getting out of control
vim.api.nvim_exec([[ autocmd FileType bash setlocal commentstring=# %s ]], false)
-------------------------------------
---- Plugin Manager Self-Install ----
-------------------------------------
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

------------------------
---- Import Modules ----
------------------------
-- require('plugins')

-- set leader before loading plugins
vim.g.mapleader = ','
require('lazy').setup("plugins")


-- and the autocommands
require('config.autocmds')

-------------------
---- Settings! ----
-------------------
vim.cmd[[
  set nocompatible
  filetype plugin on
]]

-- load the rest of the keybinds
require('keybinds')
