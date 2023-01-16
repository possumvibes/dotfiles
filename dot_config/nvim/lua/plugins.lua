-----------------
-- Plugins.lua --
-----------------

------------------------------
---- Plugin Configuration ----
------------------------------

return { 
  -- Themes
  { "catppuccin/nvim", name = "catppuccin" }, -- Catppuccin Theme

  -- General Appearances and tools
  'echasnovski/mini.nvim',
  'norcalli/nvim-colorizer.lua',
  'nvim-tree/nvim-web-devicons', -- web devicons, required by many things
  'nvim-lua/plenary.nvim', --required by telescope 
  'nvim-lualine/lualine.nvim', -- Status bar

  -- some actual vim plugins
  'tpope/vim-fugitive',
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',

  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      view = {
        merge_tool = {
          layout = "diff4_mixed"
        }
      }
    }
  },
  -- surround plugin
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true
  },

  -- Telescope and extensions
  {
    'nvim-telescope/telescope.nvim',
		version = '0.1.0',
    dependencies = {'nvim-lua/plenary.nvim'}
  },

  -- Markdown Notebook Infrastructure
  {
		'jakewvincent/mkdnflow.nvim',
		opts = {
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
		}
	},

-- LSP 
	'neovim/nvim-lspconfig',

	-- Treesitter and extensions
	{
		'nvim-treesitter/nvim-treesitter',
		build = function()
			-- automatically run update on install so packer doesn't error
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	},
	'nvim-treesitter/nvim-treesitter-textobjects',
	'JoosepAlviste/nvim-ts-context-commentstring',
}

