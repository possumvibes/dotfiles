------------------------
-- Ye Olde (Neo)Vimrc --
------------------------

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

-- load the rest of the keybinds
require('keybinds')

-- and the autocommands
require('config.autocmds')

-------------------
---- Settings! ----
-------------------
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
vim.opt.termguicolors = true  -- truly no idea but it's important for at least one plugin and general rendering?

-- Autocommands because this vimrc is getting out of control
vim.api.nvim_exec([[ autocmd FileType bash setlocal commentstring=# %s ]], false)

-- Vibes (namely, plugins) 
vim.cmd.colorscheme 'catppuccin-mocha' --  Catppuccin mocha my beloved

require('colorizer').setup() -- highlights hex codes with the color
--
-- status bar because #aestheticOrDeath
require('lualine').setup({
  options = {
    theme = 'catppuccin'
  }
})

-- mini library: Using A Bunch Of 'Em
require('mini.align').setup() -- table alignment
require('mini.comment').setup({
  hooks = {
    pre = function()
      require('ts_context_commentstring.internal').update_commentstring();
    end
  },
  mappings = {
    -- default mapping is a line-jump SFB so leader key it is!
    comment = '<leader>c',
    comment_line = '<leader>cc',
    textobject = '<leader>c' 
  }
})
require('mini.completion').setup() 
require('mini.fuzzy').setup() 
require('mini.indentscope').setup() 
require('mini.pairs').setup() 

require('nvim-treesitter.configs').setup({
  -- Parsers to auto-install
  ensure_installed = {"bash", "c", "fish", "diff", "lua", "markdown", "markdown_inline"},
  sync_install = false, 
  context_commentstring = {
    enable = true,
    enable_autocmd = false,

  },
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

require('telescope').setup{
  defaults = {
    generic_sorter = require('mini.fuzzy').get_telescope_sorter
  },
  pickers = {
    planets = {
      show_pluto = true
    }
  }
}

-- LSP Configuration
-- See https://github.com/neovim/nvim-lspconfig/#suggested-configuration
--
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>ka', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>kr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>kl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local on_attach_wkspc_only = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.keymap.set('n', '<space>ka', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>kr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>kl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
  end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require'lspconfig'.marksman.setup{
  on_attach = on_attach_wkspc_only,
  flags = lsp_flags
}

