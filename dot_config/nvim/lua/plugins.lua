-----------------
-- Plugins.lua --
-----------------

---- PLUGIN OVERVIEW ----
-- This file has the editing/typing experience. 
-- The rest is in lua/plugins/ by topic:
--
-- --------------------------------,
--   TOPIC     |  FILE             |
-- ------------+-------------------'
-- Colors      |  plugins.appearance
-- LSP         |  plugins.lsp
-- Telescope   |  plugins.telescope
-- Treesitter  |  plugins.treesitter
--

return { 

  ----------------
  --  Movement  --
  ----------------
  
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',

  -------------------------
  --  Editing and Coding --
  -------------------------

  -- Mini.Nvim: The Editor Experience
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
      require("mini.fuzzy").setup() -- for Telescope integration
      require('mini.indentscope').setup() 
      require('mini.pairs').setup() 
      require('mini.surround').setup() 
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

  -- colors on hex codes
  { 'norcalli/nvim-colorizer.lua', config = true },

  -----------------------
  --  Git integration  --
  -----------------------

  'tpope/vim-fugitive',
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      view = {
        merge_tool = { layout = "diff4_mixed" }
      }
    }
  },
}

