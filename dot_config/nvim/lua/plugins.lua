-----------------
-- Plugins.lua --
-----------------

------------------------------
---- Plugin Configuration ----
------------------------------

return { 
  -- Themes
<<<<<<< Updated upstream
  { "catppuccin/nvim", name = "catppuccin" }, -- Catppuccin Theme

  -- General Appearances and tools
  'echasnovski/mini.nvim',
  'norcalli/nvim-colorizer.lua',
  'nvim-tree/nvim-web-devicons', -- web devicons, required by many things
  'nvim-lua/plenary.nvim', --required by telescope 
  'nvim-lualine/lualine.nvim', -- Status bar
=======
<<<<<<< Updated upstream
  use { "catppuccin/nvim", as = "catppuccin" } -- Catppuccin Theme

  -- General Appearances and tools
  use 'echasnovski/mini.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-tree/nvim-web-devicons' -- web devicons, required by many things
  use 'nvim-lualine/lualine.nvim' -- Status bar
=======
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

  -- General Appearances and tools
  {
    'echasnovski/mini.nvim',
    config = function()
      -- mini library: Using A Bunch Of 'Em
      require('mini.align').setup() -- table alignment
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
      require('mini.fuzzy').setup() 
      require('mini.indentscope').setup() 
      require('mini.pairs').setup() 
    end
  },

  -- { "echasnovski/mini.align", config = true },
  -- {
  --   "echasnovski/mini.comment", 
  --   opts = {
  --     hooks = {
  --       pre = function()
  --         require('ts_context_commentstring.internal').update_commentstring();
  --       end
  --     },
  --   } 
  -- },
  -- { "echasnovski/mini.completion", config = true },
  -- { "echasnovski/mini.fuzzy", config = true },
  -- { "echasnovski/mini.indentscope", config = true },
  -- { "echasnovski/mini.pairs", config = true },

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
>>>>>>> Stashed changes
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
  {
    'nvim-telescope/telescope.nvim',
		version = '0.1.0',
    dependencies = {'nvim-lua/plenary.nvim'}
  },
=======
<<<<<<< Updated upstream
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
=======
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    'nvim-telescope/telescope.nvim',
		version = '0.1.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
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
>>>>>>> Stashed changes
>>>>>>> Stashed changes

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

<<<<<<< Updated upstream
-- LSP 
	'neovim/nvim-lspconfig',

	-- Treesitter and extensions
	{
		'nvim-treesitter/nvim-treesitter',
=======
  -- LSP 
<<<<<<< Updated upstream
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
  use 'JoosepAlviste/nvim-ts-context-commentstring'

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
=======
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
>>>>>>> Stashed changes
		build = function()
			-- automatically run update on install so packer doesn't error
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	},
<<<<<<< Updated upstream
	'nvim-treesitter/nvim-treesitter-textobjects',
	'JoosepAlviste/nvim-ts-context-commentstring',
}
=======
}
>>>>>>> Stashed changes
>>>>>>> Stashed changes

