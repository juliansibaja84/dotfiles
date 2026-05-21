local globals = {}

-- Globals
globals.DIR_HOME = os.getenv("HOME")
globals.DIR_SCRIPTS = string.format("%s/.scripts", globals.DIR_HOME)


-- Set programs that you use
globals.TERMINAL    = "kitty"
globals.FILEMANAGER = "thunar"
globals.MENU        = "wofi --show drun --prompt \"Run:\""

return globals
