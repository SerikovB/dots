local wezterm = require 'wezterm';

local config = {}
  
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "powershell.exe" }
else
  config.enable_wayland = true
  config.window_decorations = "NONE"
  config.window_close_confirmation = "NeverPrompt"
  config.freetype_load_target = "Light"
  config.freetype_render_target = "HorizontalLcd"
end

return config
