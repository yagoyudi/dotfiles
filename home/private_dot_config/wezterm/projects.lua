local wezterm = require 'wezterm'
local module = {}

local function project_dirs()
  return {
    '~/github.com/yagoyudi/dotfiles',
    '~/gitlab.c3sl.ufpr.br',
    '~/gitlab.com',
  }
end

function module.choose_project()
  local choices = {}
  for _, value in ipairs(project_dirs()) do
    table.insert(choices, { label = value })
  end

  -- The InputSelector action presents a modal UI for choosing between a set of options
  -- within WezTerm.
  return wezterm.action.InputSelector {
    title = 'Projects',
    -- The options we wish to choose from
    choices = choices,
    -- Yes, we wanna fuzzy search (so typing "alex" will filter down to
    -- "~/Projects/alexplescan.com")
    fuzzy = true,
    -- The action we want to perform. Note that this doesn't have to be a
    -- static definition as we've done before, but can be a callback that
    -- evaluates any arbitrary code.
    action = wezterm.action_callback(function(child_window, child_pane, id, label)
      -- As a placeholder, we'll log the name of what you picked
      wezterm.log_info("you chose " .. label)
    end),
  }
end

return module
