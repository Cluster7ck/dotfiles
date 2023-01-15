local wezterm = require "wezterm"
local gitbash = {"C:\\Program Files\\Git\\bin\\bash.exe", "-i", "-l"}

return {
    color_scheme = "Dracula",
    default_prog = gitbash,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    keys = {
        {
            key = "p",
	    mods="CTRL",
            action = "ShowLauncher",
        },
        {
            key = "Y",
            mods = "CTRL",
            action = "Copy",
        },       
        {
            key = "C",
            mods = "CTRL",
            action = "DisableDefaultAssignment",
        },
        {
            key = " ",
            mods = "CTRL|SHIFT",
            action = "ActivateCopyMode",
        },
        {
            key = "9",
            mods = "ALT",
            action = "DisableDefaultAssignment",
        },
    },

    font_dirs = {"C:\\Windows\\Fonts"},

    font_rules = {
        {
            italic = false,
            bold = false,
            font = wezterm.font("Fira Code"),
        },
        {
            italic = true,
            bold = false,
            font = wezterm.font("Fira Code"),
        },
        {
            italic = false,
            bold = true,
            font = wezterm.font("Fira Code Bold"),
        },
        {
            italic = true,
            bold = true,
            font = wezterm.font("Fira Code Bold"),
        },
    },

    launch_menu = {
        {
            label = "Ubuntu WSL",
            args = {"wsl", "-d", "Ubuntu-20.04"},
        },
        {
            label = "Powershell",
            args = {"powershell"},
        },
        {
            label = "Git Bash",
            args = gitbash,
        },
    },
}
