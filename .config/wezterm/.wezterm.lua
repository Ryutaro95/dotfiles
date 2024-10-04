local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local act = wezterm.action

-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width) end)

config = {
	window_background_opacity = 1,
	macos_window_background_blur = 60,

	-- color_scheme = "Tokyo Night Storm",
	color_scheme = "Ayu Mirage",
	colors = {
		selection_fg = "none",
		selection_bg = "rgba(50% 50% 50% 50%)",

		-- Tab style
		tab_bar = {
			active_tab = {
				bg_color = "#E95678",
				fg_color = "#1E1E32",
			},
			inactive_tab = {
				bg_color = "#2E303E",
				fg_color = "#646482",
			},
		},
	},

	-- Tab
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	window_frame = {
		font_size = 13.0,
		inactive_titlebar_bg = "none",
		active_titlebar_bg = "none",
	},

	-- Font settings
	font = wezterm.font("Hack Nerd Font", {
		stretch = "Normal",
		style = "Normal",
	}),

	window_padding = {
		left = 30,
		right = 30,
		top = 60,
		bottom = 0,
	},

	-- general options
	adjust_window_size_when_changing_font_size = false,
	-- enable_tab_bar = false,
	debug_key_events = false,
	native_macos_fullscreen_mode = false,

	-- Window
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",

	-- Text
	font_size = 13,
	cell_width = 1.1,
	line_height = 1.3,

	initial_rows = 60,
	initial_cols = 150,
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

return config
