local wezterm = require "wezterm"
local gitbash = {"C:\\Program Files\\Git\\bin\\bash.exe", "-i", "-l"}

return {
    color_scheme = "kanagawabones",
	force_reverse_video_cursor = true,
    default_prog = gitbash,
    default_cursor_style = 'SteadyBar',
    cursor_thickness = 2.0,
    window_close_confirmation = "NeverPrompt",
    skip_close_confirmation_for_processes_named = { 'bash.exe', 'powershell.exe', 'cmd.exe', 'pwsh.exe'},
    -- window_decorations = "RESIZE",
    hide_tab_bar_if_only_one_tab = true,
    check_for_updates = true,
    check_for_updates_interval_seconds = 86400,
    show_update_window = true,
    keys = {
        {
            key = "p",
            mods="CTRL",
            action = "ShowLauncher",
        },
        {
            key = "Y",
            mods = "CTRL",
            action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
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
        {
            key = "LeftArrow",
            mods = "CTRL|ALT",
            action = wezterm.action.ActivatePaneDirection("Left"),
        },
        {
            key = "RightArrow",
            mods = "CTRL|ALT",
            action = wezterm.action.ActivatePaneDirection("Right"),
        },
        {
            key = "UpArrow",
            mods = "CTRL|ALT",
            action = wezterm.action.ActivatePaneDirection("Up"),
        },
        {
            key = "DownArrow",
            mods = "CTRL|ALT",
            action = wezterm.action.ActivatePaneDirection("Down"),
        },
	{
	  key = 'w',
	  mods = 'CTRL|SHIFT',
	  action = wezterm.action.CloseCurrentTab { confirm = false }
	},
    },

    font_dirs = {"C:\\Windows\\Fonts"},

    font_rules = {
        {
            italic = false,
            intensity = "Half",
            font = wezterm.font("Fira Code"),
        },
        {
            italic = true,
            intensity = "Normal",
            font = wezterm.font("Fira Code"),
        },
        {
            italic = false,
            intensity = "Bold",
            font = wezterm.font("Fira Code Bold"),
        },
        {
            italic = true,
            intensity = "Bold",
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
