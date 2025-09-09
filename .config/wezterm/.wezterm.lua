local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end
local act = wezterm.action

-- カラースキームの名前を変数に保存
local color_scheme_name = "OneDark (base16)"

config = {
	-- Window settings
	window_decorations = "RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW",
	window_background_opacity = 0.97,
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
	color_scheme = color_scheme_name,

	-- Font settings
	font = wezterm.font("JetBrains Mono NL", {
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

	leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
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
		{ key = "[", mods = "CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "]", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
		{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	},
}

-- カラースキームの背景色を取得してタブバーに適用
local scheme = wezterm.color.get_builtin_schemes()[color_scheme_name]
if scheme then
	config.colors = {
		selection_fg = "none",
		selection_bg = "rgba(50% 50% 50% 50%)",
		tab_bar = {
			background = scheme.background,
		},
	}
end

return config
