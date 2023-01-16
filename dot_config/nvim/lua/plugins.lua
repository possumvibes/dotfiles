-----------------
-- Plugins.lua --
-----------------

------------------------------
---- Plugin Configuration ----
------------------------------

return { 
  -- Themes
  { 
    "catppuccin/nvim", name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      --set colorscheme here
      vim.cmd.colorscheme 'catppuccin-mocha'
    end
  }, -- Catppuccin Theme

  -- dependencies
  'nvim-tree/nvim-web-devicons', -- web devicons, required by many things
  'nvim-lua/plenary.nvim', --required by telescope 

  -- -- General Appearances and tools
  -- {
  --   'echasnovski/mini.nvim',
  --   config = function()
  --     -- mini library: Using A Bunch Of 'Em
  --     -- require('mini.align').setup() -- table alignment
  --     require('mini.comment').setup({
  --       hooks = {
  --         pre = function()
  --           require('ts_context_commentstring.internal').update_commentstring();
  --         end
  --       },
  --       mappings = {
  --         -- default mapping is a line-jump SFB so leader key it is!
  --         comment = '<leader>c',
  --         comment_line = '<leader>cc',
  --         textobject = '<leader>c' 
  --       }
  --     })
  --     require('mini.completion').setup() 
  --     -- require('mini.fuzzy').setup() 
  --     require('mini.indentscope').setup() 
  --     require('mini.pairs').setup() 
  --   end
  -- },
  --
  { 
    "echasnovski/mini.align", 
    config = function() require('mini.align').setup() end 
  },
  {
    "echasnovski/mini.comment",
    opts = {
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
    },
    config = function(_, opts)
      require('mini.comment').setup(opts)
    end
  },

  {
    "echasnovski/mini.completion",
    config = function() require('mini.completion').setup() end
  },
  {
    "echasnovski/mini.fuzzy", 
    config = function() require('mini.fuzzy').setup() end 
  },
  {
    "echasnovski/mini.indentscope", 
    config = function() require('mini.indentscope').setup() end 
  },
  {
    "echasnovski/mini.pairs", 
    config = function() require('mini.pairs').setup() end 
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = true
  },
  { 
    'nvim-lualine/lualine.nvim',
    dependencies = { 'catppuccin/nvim'},
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
    dependencies = {
      'nvim-lua/plenary.nvim',
      'echasnovski/mini.fuzzy'
    },
    opts = {
      defaults = {

      },
      pickers = {
        planets = {show_pluto = true}
      }
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
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

  -- LSP 
	{
    'neovim/nvim-lspconfig',

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

