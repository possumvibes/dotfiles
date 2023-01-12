-----------------
-- Plugins.lua --
-----------------

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
  use 'wbthomason/packer.nvim' -- Plugin manager self-manages!
  
  -- General Appearances and tools
  use { "catppuccin/nvim", as = "catppuccin" } -- Catppuccin Theme
  use 'echasnovski/mini.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-tree/nvim-web-devicons' -- web devicons, required by many things
  use 'nvim-lualine/lualine.nvim' -- Status bar

  -- Telescope and extensions
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Markdown Notebook Infrastructure
  use({'jakewvincent/mkdnflow.nvim',
    config = function()
      require('mkdnflow').setup({
        links = {
          conceal = true
        },
        mappings = {
          MkdnEnter = {{'i', 'n', 'v'}, '<CR>'},
          MkdnGoBack = {'n', '<M-Left>'},
          MkdnGoForward = {'n', '<M-Right>'},
          MkdnFoldSection = {'n', '<leader>Fc'},
          MkdnUnfoldSection = {'n', '<leader>Fo'}
        }
      })
     end
  })

  -- LSP 
  use 'neovim/nvim-lspconfig'

  -- Treesitter and extensions
  use {
    'nvim-treesitter/nvim-treesitter',
      run = function()
          -- automatically run update on install so packer doesn't error
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- and most importantly: 🦆
  use {
    'tamton-aquib/duck.nvim',
    config = function()
        vim.keymap.set('n', '<leader>nd', function() require("duck").hatch() end, {})
        vim.keymap.set('n', '<leader>nk', function() require("duck").cook() end, {})
    end
  }

  -- Packer Bootstrapping: sync after cloning
  if packer_bootstrap then
    require('packer').sync()
  end
end)

