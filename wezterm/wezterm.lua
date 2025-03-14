local constants = require("constants")
local commands = require("commands")
local colors = require("plugins.colors")
local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Colors
config.colors = colors

config.colors = {
	cursor_bg = "pink",
	cursor_border = "pink",
	foreground = "#D9E0EE", -- Light text color from Catppuccin
	background = "#1E1E2E", -- Dark background from Catppuccin
	cursor_fg = "#1E1E2E", -- Cursor foreground color
	selection_bg = "#4C4E5C", -- Selection background color
	selection_fg = "#D9E0EE",
}

config.color_scheme = "Catppuccin Mocha"

config.window_background_image_hsb = {
	brightness = 0.06,
	hue = 1.0, -- Keep hue unchanged
	saturation = 1.0, -- Keep saturation unchanged
}
-- Apperance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_image = constants.bg_image
config.macos_window_background_blur = 40 -- doesnt work in cinnamon
config.window_close_confirmation = "NeverPrompt"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Miscellaneous settings
config.max_fps = 120
config.prefer_egl = true

-- Custom commands
wezterm.on("augment-command-palette", function()
	return commands
end)

config.keys = {
	{ key = "Q", mods = "CTRL|SHIFT", action = wezterm.action.QuitApplication }, -- Add this line to close WezTerm
}

return config
