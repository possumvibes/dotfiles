------------------------
-- Ye Olde (Neo)Vimrc --
------------------------

------------------------
---- Import Modules ----
------------------------
require('plugins')
require('keymap')

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
vim.cmd.colorscheme 'catppuccin' --  Catppuccin mocha my beloved

require('colorizer').setup() -- highlights hex codes with the color
--
-- status bar because #aestheticOrDeath
require('lualine').setup({
  options = {
    theme = 'catppuccin'
  }
})

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
require('mini.fuzzy').setup() -- fuzzy finder for telescope
require('mini.indentscope').setup() -- visual of the current indent-scope
require('mini.pairs').setup() -- AUTOPAIRING BAYBEYYYYYY
require('mini.surround').setup() -- surround objects/selections with brackets/quotes


require('nvim-treesitter.configs').setup({
  -- Parsers to auto-install
  ensure_installed = {"bash", "c", "diff", "lua", "markdown", "markdown_inline"},
  sync_install = false, 
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

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require'lspconfig'.marksman.setup{
  on_attach = on_attach,
  flags = lsp_flags
}

