-- lua/core/keymaps.lua

-- We wrap this in a function so it doesn't run until you actually press the key
vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').find_files() end, {})
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, {})

-- Show the error message in a floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- Move between errors
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Trigger signature help (Pyright/ZLS arguments)
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = "Show function signature" })
