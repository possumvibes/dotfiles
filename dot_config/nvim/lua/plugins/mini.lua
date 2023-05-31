return {

  -- Mini.Nvim: The Editor Experience
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.align').setup()
      -- require('mini.ai').setup()
      require('mini.bufremove').setup()
      require('mini.comment').setup({
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          end,
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
    end,
    event = "BufEnter"
  },

}
