-- ~/.config/nvim/init.lua

require("core.options")
require("plugins") -- This runs lazy.setup and installs things
-- Note: We don't need to manually require themes here if you 
-- put the theme setup inside the lazy config block!
require("core.keymaps")
