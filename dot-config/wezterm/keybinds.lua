local kb = {}
local wt = require("wezterm")

kb.leader = {
	key = "a",
	mods = "ALT",
	timeout_milliseconds = 1000,
}

kb.keys = {
	{
		key = "-",
		mods = "ALT",
		action = wt.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "=",
		mods = "ALT",
		action = wt.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "0",
		mods = "ALT",
		action = wt.action.PaneSelect({ mode = "SwapWithActive" }),
	},
	{
		key = "h",
		mods = "ALT",
		action = wt.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "ALT",
		action = wt.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "ALT",
		action = wt.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "ALT",
		action = wt.action.ActivatePaneDirection("Down"),
	},
	{
		key = "h",
		mods = "ALT|CTRL",
		action = wt.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "l",
		mods = "ALT|CTRL",
		action = wt.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "k",
		mods = "ALT|CTRL",
		action = wt.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "j",
		mods = "ALT|CTRL",
		action = wt.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "q",
		mods = "ALT",
		action = wt.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "r",
		mods = "ALT",
		action = wt.action.RotatePanes("Clockwise"),
	},
}

for i = 1, 9 do
	table.insert(kb.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wt.action.ActivateTab(i - 1),
	})
end

function kb.apply(cfg)
	cfg.leader = kb.leader
	cfg.keys = kb.keys
end

return kb
