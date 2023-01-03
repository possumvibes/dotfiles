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
vim.keymap.set('n', '<leader>.', '<C-W>', {desc = 'window'})

vim.keymap.set('n', '<leader>m', '<cmd>NvimTreeToggle<cr>', {desc = 'toggle nvimTree'})
vim.keymap.set('n', '<leader>v', ':source $MYVIMRC<cr>', {desc = 'Reload config, sync plugins'})
vim.keymap.set('n', '<leader>vp', '<cmd>source $MYVIMRC | PackerSync<cr>', {desc = 'Reload config, sync plugins'})
vim.keymap.set('n', '<leader>x', '<cmd>NvimTreeToggle<cr>', {desc = 'Toggle Explorer'})

vim.keymap.set('n', 'Y', 'yy', {desc = "Y copies the full line"})
-- vim.keymap.set("i", '<C-S>', '<cmd>write<cr>')
vim.keymap.set("n", '<C-S>', '<cmd>write<cr>')
vim.keymap.set("i", '<C-S>', '<c-o>:update<cr>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

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
  ensure_installed = {"bash", "c", "fish", "diff", "lua", "markdown", "markdown_inline"},
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

-- LSP Configuration
-- pulled from right exactly here https://github.com/neovim/nvim-lspconfig/#suggested-configuration
-- keybinds for lsp completion/diagnostic
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

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

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require'lspconfig'.marksman.setup{
  on_attach = on_attach,
  flags = lsp_flag
}

