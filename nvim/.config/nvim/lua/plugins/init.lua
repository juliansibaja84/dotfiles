local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 1. Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("themes.catppuccin")
    end
  },

  -- 2. Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- 3. Treesitter
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "c", "lua", "python", "vim", "vimdoc", "query", "javascript", "html", "zig" },
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
  },

  -- 4. Colors
  { 
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },

  -- 5. LSP Support
  { 
    "neovim/nvim-lspconfig",
    config = function()
      -- This ensures lspconfig has loaded its "recipes" 
      -- before we call them in our lsp.lua file
      require("plugins.lsp")
    end
  },
})
