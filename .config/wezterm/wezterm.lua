local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

return {
	font = wezterm.font("VictorMono Nerd Font", { weight = "Regular" }),
	font_size = 17.0,
	line_height = 1.2,
	color_scheme = "scottmackey",
	default_cursor_style = "BlinkingBlock",
	cursor_thickness = 14.0,
	-- cursor_blink_rate = 800,
	hide_mouse_cursor_when_typing = true,
	enable_scroll_bar = false,
	window_decorations = "RESIZE",
	window_frame = {
		font_size = 14.0,
	},
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 0,
	},
	-- window_background_image = "/Users/scott/Library/Mobile Documents/com~apple~CloudDocs/Wallpaper/apple-wonderlust-2880x1800.jpg",
	window_background_image_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 0.3,
	},
	window_background_opacity = 0.95,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	-- keys = {
	-- 	{ key = "l", mods = "CTRL", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	-- 	{ key = "h", mods = "CTRL", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	-- 	{ key = "w", mods = "CTRL", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	-- 	{ key = "t", mods = "CTRL", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	-- 	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	-- 	{ key = "LeftArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	-- 	{ key = "RightArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	-- 	{ key = "UpArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	-- 	{ key = "DownArrow", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	-- 	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
	-- 	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
	-- 	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
	-- 	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
	-- 	{ key = "LeftArrow", mods = "CTRL|ALT", action = wezterm.action({ AdjustPaneSize = { "Left", -5 } }) },
	-- 	{ key = "RightArrow", mods = "CTRL|ALT", action = wezterm.action({ AdjustPaneSize = { "Right", -5 } }) },
	-- 	{ key = "UpArrow", mods = "CTRL|ALT", action = wezterm.action({ AdjustPaneSize = { "Up", -5 } }) },
	-- },
}
