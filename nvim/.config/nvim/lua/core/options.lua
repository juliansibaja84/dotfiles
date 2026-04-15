vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.opt.termguicolors = true
vim.g.mapleader = " "

vim.diagnostic.config({
  virtual_text = true, -- Shows the error at the end of the line
  signs = true,        -- Keeps the "E" in the gutter
  update_in_insert = false,
  underline = true,    -- Underlines the actual code with the error
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})
