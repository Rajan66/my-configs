local wezterm = require("wezterm")

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#000000"
custom.tab_bar = {
   background = "#040404",
    inactive_tab = {
        bg_color = "#0f0f0f",
        fg_color = "#808080",
    },
    new_tab = {
        bg_color = "#080808",
        fg_color = "#808080",
    },
}

return custom

