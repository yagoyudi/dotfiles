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
config.hide_tab_bar_if_only_one_tab = false
config.hide_mouse_cursor_when_typing = true
config.tab_bar_at_bottom = true

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

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = '-', mods = "LEADER", action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '=', mods = "LEADER", action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'm', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },
  { key = '[', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },
  { key = "c", mods = "LEADER", action = wezterm.action{SpawnTab="CurrentPaneDomain"} },
  { key = "h", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
  { key = "j", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
  { key = "k", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
  { key = "l", mods = "LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},
  { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
  { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
  { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
  { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
  { key = "d", mods = "LEADER", action=wezterm.action{CloseCurrentPane={confirm=true}}},

  { key="1", mods="LEADER", action=wezterm.action{ActivateTab=0} },
  { key="2", mods="LEADER", action=wezterm.action{ActivateTab=1} },
  { key="3", mods="LEADER", action=wezterm.action{ActivateTab=2} },
  { key="4", mods="LEADER", action=wezterm.action{ActivateTab=3} },
  { key="5", mods="LEADER", action=wezterm.action{ActivateTab=4} },
  { key="6", mods="LEADER", action=wezterm.action{ActivateTab=5} },
  { key="7", mods="LEADER", action=wezterm.action{ActivateTab=6} },
  { key="8", mods="LEADER", action=wezterm.action{ActivateTab=7} },
  { key="9", mods="LEADER", action=wezterm.action{ActivateTab=8} },

  {
    key = "w",
    mods = "LEADER",
    action = wezterm.action.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Enter name for new workspace" },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            wezterm.action.SwitchToWorkspace({
              name = line,
            }),
            pane
          )
        end
      end),
    }),
  },
  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action.ShowLauncherArgs({
      flags = "FUZZY|WORKSPACES",
    }),
  },
}

return config
