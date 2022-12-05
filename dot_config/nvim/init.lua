--------------
-- init.lua --
--------------

-- How To Update This File With Chezmoi
-- 1. cme .config/nvim/init.lua
-- 2. Write changes 
-- 3. IN A SEPARATE TERMINAL INSTANCE (or after :wq):
--    a. call cmap to apply changes
--    b. open a new nvim instance
--    c. run `:source $MYVIMRC` to reload init.lua
-- 4. Return to editing instance, if not complete.

-- The nvim instance will not pick up the changes
-- because the actual init.lua change happens through chezmoi
-- so the fastest way to get the package sync to happen
-- is to use a separate terminal

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

require('Comment').setup()

require('nvim-tree').setup()

require('nvim-treesitter.configs').setup({
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


require('lualine').setup({
  options = {
    theme = 'catppuccin'
  }
})



