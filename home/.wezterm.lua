local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end
local act = wezterm.action

config = {
	-- Window settings
	window_decorations = "RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW",
	window_background_opacity = 0.99,
	macos_window_background_blur = 60,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 20,
		right = "0.5cell",
		top = "0.5cell",
		bottom = "0.5cell",
	},
	window_frame = {
		font_size = 12.0,
	},
	-- Font settings
	font = wezterm.font("JetBrainsMono Nerd Font", {
		weight = "Regular",
	}),

	-- Text
	font_size = 13,
	freetype_load_target = "Light",
	freetype_render_target = "HorizontalLcd",
	initial_rows = 32,
	initial_cols = 120,

	-- general options
	adjust_window_size_when_changing_font_size = false,
	use_fancy_tab_bar = true,
	debug_key_events = false,
	native_macos_fullscreen_mode = false,
	use_ime = true,
	-- ↓ ctrl-h で変換済みの文字削除問題を解消してくれる
	macos_forward_to_ime_modifier_mask = "SHIFT|CTRL",

	leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 },
	-- key maps

	keys = {
		-- Split Pane
		{
			key = "s",
			mods = "LEADER",
			action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 30 } }),
		},
		{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = ",", mods = "CTRL", action = act.ActivateTabRelative(-1) },
		{ key = ".", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "h", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
		{ key = "l", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
		{ key = "m", mods = "LEADER", action = act.TogglePaneZoomState },
		{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
		{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
	},
}

-- jb-dark (Ghostty) をベースにしたカスタムカラースキーム
config.colors = {
	foreground = "#BCBEC4",
	background = "#1E1F22",

	cursor_bg = "#CED0D6",
	cursor_fg = "#1E1F22",
	cursor_border = "#CED0D6",

	selection_fg = "#BCBEC4",
	selection_bg = "#214283",

	-- ANSI colors (0–7)
	ansi = {
		"#000000", -- black
		"#F0524F", -- red
		"#5C962C", -- green
		"#A68A0D", -- yellow
		"#3993D4", -- blue
		"#A771BF", -- magenta
		"#00A3A3", -- cyan
		"#808080", -- white
	},
	-- Bright colors (8–15)
	brights = {
		"#595959", -- bright black
		"#FF4050", -- bright red
		"#4FC414", -- bright green
		"#E5BF00", -- bright yellow
		"#1FB0FF", -- bright blue
		"#ED7EED", -- bright magenta
		"#00E5E5", -- bright cyan
		"#FFFFFF", -- bright white
	},

	tab_bar = {
		background = "#1E1F22",
	},
}

config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

return config
