-- lua/plugins/lsp.lua

-- Zig (ZLS)
vim.lsp.config('zls', {
  cmd = { "zls" },
  filetypes = { "zig", "zir" },
  root_markers = { "build.zig", ".git" },
  -- settings = {
  --   zls = { enable_autofix = true }
  -- }
})

-- Python (Pyright)
vim.lsp.config('pyright', {})

-- Enable the configurations
vim.lsp.enable('zls')
vim.lsp.enable('pyright')
