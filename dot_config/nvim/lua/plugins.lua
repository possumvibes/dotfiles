-----------------
-- Plugins.lua --
-----------------

-- How To Update This File With Chezmoi
-- 1. cme .config/nvim/lua/plugins.lua
-- 2. Add the plugin to the packer startup function.
-- 3. Write changes 
-- 4. IN A SEPARATE TERMINAL INSTANCE (or after :wq):
--    a. call chezmoi apply to apply changes
--    b. open a new nvim instance
--    c. run `:PackerSync` to install new plugins
-- 4. NOW you can add the usage into the init.lua.

-------------------------------------
---- Plugin Manager Self-Install ----
-------------------------------------

-- Ensures packer is installed automatically. 
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

------------------------------
---- Plugin Configuration ----
------------------------------

return require('packer').startup(function(use)
  -- Plugin manager self-manages!
  use 'wbthomason/packer.nvim'
  
  -- Catppuccin Theme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Lualine status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- duck! O> 
  use {
    'tamton-aquib/duck.nvim',
    config = function()
        vim.keymap.set('n', '<leader>nd', function() require("duck").hatch() end, {})
        vim.keymap.set('n', '<leader>nk', function() require("duck").cook() end, {})
    end
  }

  -- Treesitter!
  use {
    'nvim-treesitter/nvim-treesitter',
      run = function()
          -- automatically run update on install so packer doesn't error
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Tree File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
       'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  -- Using the mini.nvim library for Many Things
  use 'echasnovski/mini.nvim'

  -- color highlighter
  use 'norcalli/nvim-colorizer.lua'


  -- LSP
  use { 
    'neovim/nvim-lspconfig',
    -- config = function()
    --   require('lspconfig').marksman.setup()
    -- end
  }-- Configurations for Nvim LSP

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

