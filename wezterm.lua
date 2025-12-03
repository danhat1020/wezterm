local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- enable wayland support
config.enable_wayland = false
-- colors
config.color_scheme = "Ollie"
config.colors = {
	foreground = "#f0f0f0",
	background = "#080808",

	cursor_bg = "#f0f0f0",
	cursor_fg = "#080808",
	cursor_border = "#f0f0f0",
}
-- disable tab bar
config.enable_tab_bar = false
-- default directory
config.default_cwd = "/home/slick"
-- fonts
config.font = wezterm.font("Iosevka Nerd Font Mono")
config.font_size = 19
config.cell_width = 0.9
config.line_height = 0.9
config.adjust_window_size_when_changing_font_size = false
config.bold_brightens_ansi_colors = "No"
config.freetype_load_target = "Normal"
config.harfbuzz_features = { "calt=0" }
-- cursor
config.default_cursor_style = "SteadyBlock"
-- terminal
config.term = "xterm-256color"
config.window_close_confirmation = "NeverPrompt"
config.max_fps = 120
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
return config
