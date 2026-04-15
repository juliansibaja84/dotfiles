-- lua/plugins/lsp.lua
-- Create the capabilities object to tell the LSP we want completions
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Zig (ZLS)
vim.lsp.config('zls', {
  cmd = { "zls" },
  filetypes = { "zig", "zir" },
  root_markers = { "build.zig", ".git" },
  -- settings = {
  --   zls = { enable_autofix = true }
  -- }
  capabilities = capabilities,
})

-- Python (Pyright)
vim.lsp.config('pyright', {
  capabilities = capabilities,
})

-- Enable the configurations
vim.lsp.enable('zls')
vim.lsp.enable('pyright')
