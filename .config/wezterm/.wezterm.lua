local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	color_scheme = "Tokyo Night Storm",
	-- Font settings
	font = wezterm.font("Hack Nerd Font", {
		weight = "Bold",
		stretch = "Normal",
		style = "Normal",
	}),
	font_size = 14,
	cell_width = 1.1,
	line_height = 1.3,
	-- Title bar
	window_decorations = "INTEGRATED_BUTTONS | RESIZE",
	-- Tab bar
	tab_max_width = 20,
	use_fancy_tab_bar = false,

	initial_rows = 30,
	initial_cols = 100,
	use_ime = true,

	leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		-- Split Pane
		{ key = "v", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "s", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
		{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

		-- Switch Pane
		{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	},
}

return config
