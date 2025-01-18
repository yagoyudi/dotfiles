local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

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

-- Key bindings

config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseconds = 2000
}

config.keys = {
    -- -- Disable Alt-Enter combination (already used in tmux to split pane)
    -- {
    --     key = 'Enter',
    --     mods = 'ALT',
    --     action = act.DisableDefaultAssignment,
    -- },

    -- Copy mode
    {
        key = '[',
        mods = 'LEADER',
        action = act.ActivateCopyMode,
    },

    -- ----------------------------------------------------------------
    -- TABS
    --
    -- Where possible, I'm using the same combinations as I would in tmux
    -- ----------------------------------------------------------------

    -- Show tab navigator; similar to listing panes in tmux
    {
        key = 'w',
        mods = 'LEADER',
        action = act.ShowTabNavigator,
    },
    -- Create a tab (alternative to Ctrl-Shift-Tab)
    {
        key = 'c',
        mods = 'LEADER',
        action = act.SpawnTab 'CurrentPaneDomain',
    },
    -- Rename current tab; analagous to command in tmux
    {
        key = ',',
        mods = 'LEADER',
        action = act.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(
                function(window, pane, line)
                    if line then
                        window:active_tab():set_title(line)
                    end
                end
            ),
        },
    },
    -- Move to next/previous TAB
    {
        key = 'n',
        mods = 'LEADER',
        action = act.ActivateTabRelative(1),
    },
    {
        key = 'p',
        mods = 'LEADER',
        action = act.ActivateTabRelative(-1),
    },
    -- Close tab
    {
        key = '&',
        mods = 'LEADER|SHIFT',
        action = act.CloseCurrentTab{ confirm = true },
    },

    -- ----------------------------------------------------------------
    -- PANES
    --
    -- These are great and get me most of the way to replacing tmux
    -- entirely, particularly as you can use "wezterm ssh" to ssh to another
    -- server, and still retain Wezterm as your terminal there.
    -- ----------------------------------------------------------------

    -- -- Vertical split
    {
        -- |
        key = '|',
        mods = 'LEADER|SHIFT',
        action = act.SplitPane {
            direction = 'Right',
            size = { Percent = 50 },
        },
    },
    -- Horizontal split
    {
        -- -
        key = '-',
        mods = 'LEADER',
        action = act.SplitPane {
            direction = 'Down',
            size = { Percent = 50 },
        },
    },
    -- CTRL + (h,j,k,l) to move between panes
    {
        key = 'h',
        mods = 'CTRL',
        action = act({ EmitEvent = "move-left" }),
    },
    {
        key = 'j',
        mods = 'CTRL',
        action = act({ EmitEvent = "move-down" }),
    },
    {
        key = 'k',
        mods = 'CTRL',
        action = act({ EmitEvent = "move-up" }),
    },
    {
        key = 'l',
        mods = 'CTRL',
        action = act({ EmitEvent = "move-right" }),
    },
    -- ALT + (h,j,k,l) to resize panes
    {
        key = 'h',
        mods = 'ALT',
        action = act({ EmitEvent = "resize-left" }),
    },
    {
        key = 'j',
        mods = 'ALT',
        action = act({ EmitEvent = "resize-down" }),
    },
    {
        key = 'k',
        mods = 'ALT',
        action = act({ EmitEvent = "resize-up" }),
    },
    {
        key = 'l',
        mods = 'ALT',
        action = act({ EmitEvent = "resize-right" }),
    },
    -- Close/kill active pane
    {
        key = 'x',
        mods = 'LEADER',
        action = act.CloseCurrentPane { confirm = true },
    },
    -- Swap active pane with another one
    {
        key = '{',
        mods = 'LEADER|SHIFT',
        action = act.PaneSelect { mode = "SwapWithActiveKeepFocus" },
    },
    -- Zoom current pane (toggle)
    {
        key = 'z',
        mods = 'LEADER',
        action = act.TogglePaneZoomState,
    },
    {
        key = 'f',
        mods = 'ALT',
        action = act.TogglePaneZoomState,
    },
    -- Move to next/previous pane
    {
        key = ';',
        mods = 'LEADER',
        action = act.ActivatePaneDirection('Prev'),
    },
    {
        key = 'o',
        mods = 'LEADER',
        action = act.ActivatePaneDirection('Next'),
    },

    -- ----------------------------------------------------------------
    -- Workspaces
    --
    -- These are roughly equivalent to tmux sessions.
    -- ----------------------------------------------------------------

    -- Attach to muxer
    {
        key = 'a',
        mods = 'LEADER',
        action = act.AttachDomain 'unix',
    },

    -- Detach from muxer
    {
        key = 'd',
        mods = 'LEADER',
        action = act.DetachDomain { DomainName = 'unix' },
    },

    -- Show list of workspaces
    {
        key = 's',
        mods = 'LEADER',
        action = act.ShowLauncherArgs { flags = 'WORKSPACES' },
    },
    -- Rename current session; analagous to command in tmux
    {
        key = '$',
        mods = 'LEADER|SHIFT',
        action = act.PromptInputLine {
            description = 'Enter new name for session',
            action = wezterm.action_callback(
                function(window, pane, line)
                    if line then
                        mux.rename_workspace(
                            window:mux_window():get_workspace(),
                            line
                        )
                    end
                end
            ),
        },
    },

    -- Session manager bindings
    {
        key = 's',
        mods = 'LEADER|SHIFT',
        action = act({ EmitEvent = "save_session" }),
    },
    {
        key = 'L',
        mods = 'LEADER|SHIFT',
        action = act({ EmitEvent = "load_session" }),
    },
    {
        key = 'R',
        mods = 'LEADER|SHIFT',
        action = act({ EmitEvent = "restore_session" }),
    },
}

return config
