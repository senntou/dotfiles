local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font_size = 13.0
config.window_background_opacity = 0.85

-- タイトルバーを非表示
config.window_decorations = "RESIZE"


-- WSL ONLY
-- config.default_prog = {'ubuntu.exe'}

return config
