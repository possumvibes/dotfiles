-----------------
-- Plugins.lua --
-----------------

-----------------------------------------
---- Plugins Not Otherwise Specified ----
-----------------------------------------

return { 
  -- dependencies
  'nvim-tree/nvim-web-devicons', -- web devicons, required by many things

  {
    'norcalli/nvim-colorizer.lua',
    config = true
  },

  { 
    'nvim-lualine/lualine.nvim',
    dependencies = { 'catppuccin/nvim', 'nvim-tree/nvim-web-devicons'},
    opts = {
      theme = 'catppuccin'
    }
  }, -- Status bar

  -- some actual vim plugins
  'tpope/vim-fugitive',
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',

  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      view = {
        merge_tool = { layout = "diff4_mixed" }
      }
    }
  },


  -- Mini.Nvim: A Whole Bunch Of Useful Things
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.align').setup()
      require('mini.bufremove').setup()
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
      require("mini.fuzzy").setup()
      require('mini.indentscope').setup() 
      require('mini.pairs').setup() 
      require('mini.surround').setup() 
    end
  },

  -- Telescope and extensions
  {
    'nvim-telescope/telescope.nvim',
		version = '0.1.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'echasnovski/mini.nvim'
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          generic_sorter = require('mini.fuzzy').get_telescope_sorter
        },
        pickers = {
          planets = {show_pluto = true}
        }
    })
    end
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

	-- Treesitter and extensions
	'nvim-treesitter/nvim-treesitter-textobjects',
	'JoosepAlviste/nvim-ts-context-commentstring',

	{
		'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "fish",
        "diff",
        "lua",
        "markdown",
        "markdown_inline",
        "vim"
      },
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
    },
		build = function()
			-- automatically run update on install so packer doesn't error
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	},
}

