-----------------
-- Plugins.lua --
-----------------

-- How To Actually Do This
-- 1. Add the plugin to the packer startup function.
-- 2. Write. (cm apply.) 
-- 3. run :PackerSync to clean and update plugins.
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

  -- Treesitter!
  use {
    'nvim-treesitter/nvim-treesitter',
      run = function()
          -- automatically run update on install so packer doesn't error
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }

  -- Tree File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
       'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  -- Commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

