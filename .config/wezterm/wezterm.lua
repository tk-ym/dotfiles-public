-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = wezterm.config_builder()


-- ここに設定を追加する
config.automatically_reload_config = true

-- Color & Appearance
config.color_scheme = "Tokyo Night Storm"
config.window_background_opacity = 0.9
config.text_background_opacity = 1.0
config.audible_bell = "Disabled"

-- Tab
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
-- タブバーの透過
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
-- タブ同士の境界線を非表示
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}
-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false
-- タブの形をカスタマイズ
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- タブの右側の装飾
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

-- Font
config.font = wezterm.font_with_fallback {
   {
      family = 'Monaco',
      weight = 'Regular',
      assume_emoji_presentation = false,
      harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
   }
}
config.font_size = 15
config.use_ime = true

-- keybinds
-- config.disable_default_key_bindings = true
-- config.keys = require('keybinds').keys
-- config.key_tables = require('keybinds').key_tables

return config
