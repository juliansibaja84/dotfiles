-- lua/core/keymaps.lua

-- We wrap this in a function so it doesn't run until you actually press the key
vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').find_files() end, {})
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, {})
