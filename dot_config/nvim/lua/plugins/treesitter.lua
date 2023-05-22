return {
	-- Treesitter and extensions
  { 'nvim-treesitter/nvim-treesitter-textobjects', event = "BufReadPost"},
  { 'JoosepAlviste/nvim-ts-context-commentstring', event = "BufReadPost" },

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
        "vim"
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
