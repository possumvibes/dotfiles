return {
	-- Treesitter and extensions
  { 'JoosepAlviste/nvim-ts-context-commentstring', event = "BufEnter" },
  { 'nvim-treesitter/nvim-treesitter-textobjects', event = "BufEnter"},

  {
    'nvim-treesitter/nvim-treesitter-context', event = "BufEnter",
    dependencies = {'nvim-treesitter/nvim-treesitter'},
  },

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
        "rust",
        "toml",
        "vim",
        "yaml",
      },
      sync_install = false,
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      highlight = { enable = true },
      -- indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental =  "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>"
        }
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true
        }
      }
    },
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
	},
}
