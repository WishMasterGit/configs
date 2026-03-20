local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.font_size = 15
-- config.font = wezterm.font("FiraCode Nerd Font")
config.font = wezterm.font("Cascadia Code")
config.hide_tab_bar_if_only_one_tab = true
config.enable_kitty_graphics = true
config.default_prog = { "/bin/zsh", "-l", "-c", "/opt/homebrew/bin/tmux new-session -A -s main" }
config.native_macos_fullscreen_mode = true
config.window_background_image = "/Users/wmts/background.jpg"
config.window_background_image_hsb = {
	brightness = 0.04,
	hue = 1.0,
	saturation = 1.0,
}
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
return config
