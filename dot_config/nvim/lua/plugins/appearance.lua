return {

  ------------
  -- Themes --
  ------------
  { 
    "catppuccin/nvim", name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      --set colorscheme here
      vim.cmd.colorscheme 'catppuccin-mocha'
    end
  },



  ----------------
  -- Status Bar --
  ----------------
  { 
    'nvim-lualine/lualine.nvim',
    dependencies = { 'catppuccin/nvim', 'nvim-tree/nvim-web-devicons'},
    opts = {
      theme = 'catppuccin'
    },
    event = "BufEnter"
  },

  -----------------
  --  Eye Candy  --
  -----------------
  
  -- icons and emojis
  'nvim-tree/nvim-web-devicons',

 -- and most importantly: 🦆
  {
    'tamton-aquib/duck.nvim',
    keys = {
      { 
        '<leader>nd', 
        function() require("duck").hatch("🦆", 3) end,
        {desc = "hatch a duck!"} 
      },
      { 
        '<leader>nk', 
        function() require("duck").cook() end,
        {desc = "goodbye duck"}
      }
    }
  } 
}
