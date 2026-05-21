local globals = require("globals")

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function () 
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("wl-paste") --watch cliphist store
  hl.exec_cmd(string.format("%s/waybar_auto_changes", globals.DIR_SCRIPTS))
end)
