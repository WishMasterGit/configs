local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.font_size = 15
-- config.font = wezterm.font("FiraCode Nerd Font")
config.font = wezterm.font("Cascadia Code")
config.hide_tab_bar_if_only_one_tab = true
config.enable_kitty_graphics = true
config.default_prog = { "/bin/zsh", "-l", "-c", "/opt/homebrew/bin/tmux new-session -A -s main" }
return config
