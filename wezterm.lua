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
	{
		display_name = "Fira Code",
		name = "FiraCode Nerd Font",
		size = 16,
		line_height = 1.1,
		cell_width = 0.9,
	},
	{
		display_name = "Iosevka Term",
		name = "IosevkaTerm Nerd Font",
		size = 17,
		line_height = 1.0,
		cell_width = 1.0,
	},
	{
		display_name = "Iosevka Term Slab",
		name = "IosevkaTerm Slab Nerd Font",
		size = 17,
		line_height = 1.0,
		cell_width = 1.0,
	},
}
local current_font = #fonts
wezterm.on("toggle-font", function(window, pane)
	current_font = (current_font % #fonts) + 1
	local f = fonts[current_font]
	window:set_config_overrides({
		font = wezterm.font(f.name),
		font_size = f.size,
		line_height = f.line_height,
		cell_width = f.cell_width,
	})
end)

config.font = wezterm.font(fonts[current_font].name)
config.font_size = fonts[current_font].size
config.line_height = fonts[current_font].line_height
config.cell_width = fonts[current_font].cell_width

config.keys = {
	{ key = "F", mods = "CTRL|SHIFT", action = wezterm.action.EmitEvent("toggle-font") },
}

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

return config
