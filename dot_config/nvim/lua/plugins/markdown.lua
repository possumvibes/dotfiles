return { 

  -------------------------
  --  Editing and Coding --
  -------------------------

  -- Markdown Notebook Infrastructure
  {
    'jakewvincent/mkdnflow.nvim',
    opts = {
      links = {
        conceal = true
      },
      mappings = {
        MkdnEnter = {{'i', 'n', 'v'}, '<CR>'},
      }
    },
  },

}

