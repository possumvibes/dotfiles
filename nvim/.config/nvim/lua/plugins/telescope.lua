return {
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
}
