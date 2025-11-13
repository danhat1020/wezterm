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
local fonts = {
	"IosevkaTerm",
	"IosevkaTerm Slab",
}
local current_font = 1
wezterm.on("toggle-font", function(window, pane)
	current_font = (current_font % #fonts) + 1
	local f = fonts[current_font] .. " Nerd Font"
	window:set_config_overrides({
		font = wezterm.font(f),
	})
end)
config.font = wezterm.font(fonts[current_font] .. " Nerd Font")
config.font_size = 17
config.adjust_window_size_when_changing_font_size = false
config.bold_brightens_ansi_colors = "No"
config.freetype_load_target = "Normal"
-- cursor
config.default_cursor_style = "SteadyBlock"
-- terminal
config.term = "xterm-256color"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- keymaps
config.keys = { { key = "F", mods = "CTRL|SHIFT", action = wezterm.action.EmitEvent("toggle-font") } }
return config
