local wezterm = require("wezterm")

----------------------------- detect_os ----------------------------

local function detect_os()
  if wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
    return "macos"
  elseif wezterm.target_triple == "x86_64-pc-windows-msvc" then
    return "windows"
  elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
    return "linux"
  else
    return "unknown"
  end
end

local myos = detect_os()

--------------------------- detect_shell ---------------------------

local function detect_shell()
  if myos == "windows" then
    return { "wsl.exe" }
  elseif myos == "mac" then
    return { "/opt/homebrew/bin/bash", "--login", }
  else
    return {"/bin/bash", "--login"}
  end
end

---------------------------- detect_font ---------------------------

local function detect_font()
  if myos == "windows" then
    return wezterm.font("Ubuntu Mono")
  else
    return wezterm.font("UbuntuMono Nerd Font")
  end
end

------------------------------- main -------------------------------

return {
  window_close_confirmation = 'NeverPrompt',
  --default_prog = detect_shell(),

  color_scheme = 'Gruvbox Material (Gogh)',
  font = wezterm.font("Fira Code"),
  font_size = 13,

  colors = {
    --cursor_bg = '#928374',
    --cursor_border = '#928374',
  },

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  front_end = "WebGpu",
  enable_tab_bar = false,
  term = "xterm-256color",
  animation_fps = 60,
  max_fps = 60,
}
