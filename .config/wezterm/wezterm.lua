local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

local dimmer = { brightness = 0.1 }

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font('VictorMono Nerd Font', { weight = 'Regular' })
config.font_size = 17.0
config.line_height = 1.2
config.default_cursor_style = 'BlinkingBlock'
config.cursor_thickness = 14.0
config.hide_mouse_cursor_when_typing = true
config.enable_scroll_bar = false
config.window_decorations = 'RESIZE'

config.window_frame = {
  font_size = 14.0,
}
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 0,
}
config.window_background_image_hsb = {
  hue = 1.0,
  saturation = 1.0,
  brightness = 0.3,
}
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- config.window_background_image = '/Users/scott/Library/Mobile Documents/com~apple~CloudDocs/Wallpaper/apple-wonderlust-2880x1800.jpg'

config.background = {
  -- This is the deepest/back-most layer. It will be rendered first
  {
    source = {
      File = '/Users/scott/Library/Mobile Documents/com~apple~CloudDocs/Wallpaper/apple-wonderlust-2880x1800.jpg',
    },
    width = '100%',
    height = 'Contain',
    horizontal_align = 'Right',
    vertical_align = 'Top',
    repeat_x = 'NoRepeat',
    repeat_y = 'NoRepeat',
    hsb = dimmer,
  },
}

-- config.color_scheme_dirs = { '~/.config/wezterm/colors' }
config.color_scheme = 'scottmackey'

return config