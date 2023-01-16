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
    config = function()
      -- LSP Configuration
      -- See https://github.com/neovim/nvim-lspconfig/#suggested-configuration
      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>ka', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>kr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>kl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      local on_attach_wkspc_only = function(client, bufnr)
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
          vim.keymap.set('n', '<space>ka', vim.lsp.buf.add_workspace_folder, bufopts)
          vim.keymap.set('n', '<space>kr', vim.lsp.buf.remove_workspace_folder, bufopts)
          vim.keymap.set('n', '<space>kl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, bufopts)
        end

      local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
      }

      require'lspconfig'.marksman.setup{
        on_attach = on_attach_wkspc_only,
        flags = lsp_flags
      }
    end
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

