local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- システムで使用可能なfontを確認したいとき
-- wezterm ls-fonts --list-system
config.font = wezterm.font("HackGen Console NF", { weight = "Regular", stretch = "Normal", style = "Normal" })

config.automatically_reload_config = true
config.font_size = 13.0
config.window_background_opacity = 0.85

-- タイトルバーを非表示
config.window_decorations = "RESIZE"


-- WSL ONLY
-- config.default_domain = 'WSL:Ubuntu-24.04'

config.keys = {
  {
    key = 'v',
    mods = 'CTRL',
    action = wezterm.action {
      PasteFrom = 'Clipboard',
    },
  }
}

return config
