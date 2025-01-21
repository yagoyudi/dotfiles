local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 11
config.font = wezterm.font("Fira Code")

config. window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.term = "xterm-256color"
config.animation_fps = 60
config.max_fps = 60
config.window_decorations = "RESIZE"

--config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.front_end = "WebGpu"
config.enable_wayland = true

config.colors = {
  foreground = "#d4be98", -- Default text color
  cursor_bg  = "#d4be98", -- Default text color
  cursor_border = "#d4be98", -- Default text color
  background = "#282828", -- Background color
  selection_bg = "#45403d" ,

  ansi = {
    "#282828", -- Black (Normal)
    "#cc241d", -- Red (Normal)
    "#98971a", -- Green (Normal)
    "#d79921", -- Yellow (Normal)
    "#458588", -- Blue (Normal)
    "#b16286", -- Magenta (Normal)
    "#689d6a", -- Cyan (Normal)
    "#a89984", -- White (Normal)
  },
  brights = {
    "#928374", -- Bright Black
    "#fb4934", -- Bright Red
    "#b8bb26", -- Bright Green
    "#fabd2f", -- Bright Yellow
    "#83a598", -- Bright Blue
    "#d3869b", -- Bright Magenta
    "#8ec07c", -- Bright Cyan
    "#ebdbb2", -- Bright White
  }
}

return config
