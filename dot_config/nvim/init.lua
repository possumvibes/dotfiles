--------------
-- init.lua --
--------------

-- How To Update This File
-- cme .config/nvim/init.lua
-- Write changes (cm apply)
-- run `:source $MYVIMRC` to reload init.lua
-- rinse and repeat!

------------------------
---- Import Modules ----
------------------------
require('plugins')

-------------------
---- Settings! ----
-------------------

-- Appearance/Behavior
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true


-- Vibes (namely, plugins)
vim.cmd.colorscheme 'catppuccin'

--require('Comment').setup()

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true
  }
})

require('lualine').setup({
  options = {
    theme = 'catppuccin'
  }
})



