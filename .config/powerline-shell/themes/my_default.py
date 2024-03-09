from powerline_shell.themes.default import DefaultColor




class Color(DefaultColor):
    """Basic theme which only uses colors in 0-15 range"""
    USERNAME_FG = 8   # html color: #808080
    USERNAME_BG = 15  # html color: #ffffff
    USERNAME_ROOT_BG = 1  # html color: #800000

    HOSTNAME_FG = 8  # html color: #808080
    HOSTNAME_BG = 7  # html color: #c0c0c0

    HOME_SPECIAL_DISPLAY = False
    PATH_BG = 8  # html color: #808080
    PATH_FG = 7  # html color: #c0c0c0
    CWD_FG = 15  # html color: #ffffff
    SEPARATOR_FG = 7  # html color: #c0c0c0

    READONLY_BG = 1  # html color: #800000
    READONLY_FG = 15  # html color: #ffffff

    REPO_CLEAN_BG = 2   # html color: #008000
    REPO_CLEAN_FG = 0   # html color: #000000
    REPO_DIRTY_BG = 1   # html color: #800000
    REPO_DIRTY_FG = 15  # html color: #ffffff

    JOBS_FG = 14  # html color: #ff00ff
    JOBS_BG = 8  # html color: #808080

    CMD_PASSED_BG = 8  # html color: #808080
    CMD_PASSED_FG = 15  # html color: #ffffff
    CMD_FAILED_BG = 11  # html color: #ff0000
    CMD_FAILED_FG = 0  # html color: #000000

    SVN_CHANGES_BG = REPO_DIRTY_BG
    SVN_CHANGES_FG = REPO_DIRTY_FG

    VIRTUAL_ENV_BG = 2  # html color: #008000
    VIRTUAL_ENV_FG = 0  # html color: #000000

    AWS_PROFILE_FG = 14  # html color: #ff00ff
    AWS_PROFILE_BG = 8  # html color: #808080

    TIME_FG = 8  # html color: #808080
    TIME_BG = 7  # html color: #c0c0c0
