------------------------
---   Autocommands   ---
------------------------
--

-- create directories when saving a file, if needed
-- from https://github.com/folke/dot/blob/master/config/nvim/lua/config/autocmds.lua
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match

    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    local backup = vim.fn.fnamemodify(file, ":p:~:h")
    backup = backup:gsub("[/\\]", "%%")
    vim.go.backupext = backup
  end,
})


-- Set commentstrings for filetypes that don't have them automatically
vim.api.nvim_exec([[ autocmd FileType bash setlocal commentstring=# %s ]], false)
