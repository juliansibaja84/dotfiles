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
  -- 6. Auto-pairs
  { 
    "echasnovski/mini.pairs", 
    version = false, 
    config = function()
      require("mini.pairs").setup({})
    end
  },
  -- 7. Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Integration with Neovim's LSP
      "hrsh7th/cmp-buffer",   -- Suggestions from current file
      "hrsh7th/cmp-path",     -- Suggestions for file paths
      "L3MON4D3/LuaSnip",     -- Snippet engine (required by many)
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger menu manually
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept entry
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- This pulls from Zig/ZLS!
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end
  },
})
