local kb = {}
local wt = require 'wezterm'

kb.leader = {
	key = 'a',
	mods = 'ALT',
	timeout_milliseconds = 1000,
}
kb.keys = {
	{
		key = '-',
		mods = 'ALT',
		action = wt.action.SplitVertical 
			{ domain = 'CurrentPaneDomain' }
	},
	{
		key = '=',
		mods = 'ALT',
		action = wt.action.SplitHorizontal
			{ domain = 'CurrentPaneDomain' }
	},
	{
		key = '0',
		mods = 'ALT',
		action = wt.action.PaneSelect
			{ mode = 'SwapWithActive' }
	},
	{
		key = 'h',
		mods = 'ALT',
		action = wt.action.ActivatePaneDirection 'Left',
	},
	{
		key = 'l',
		mods = 'ALT',
		action = wt.action.ActivatePaneDirection 'Right',
	},
	{
		key = 'k',
		mods = 'ALT',
		action = wt.action.ActivatePaneDirection 'Up',
	},
	{
		key = 'j',
		mods = 'ALT',
		action = wt.action.ActivatePaneDirection 'Down',
	},
	{
		key = 'H',
		mods = 'ALT',
		action = wt.action.AdjustPaneSize { 'Left', 5 },
	},
	{
		key = 'L',
		mods = 'ALT',
		action = wt.action.AdjustPaneSize { 'Right', 5 }, 
	},
	{
		key = 'K',
		mods = 'ALT',
		action = wt.action.AdjustPaneSize { 'Up', 5 },
	},
	{
		key = 'J',
		mods = 'ALT',
		action = wt.action.AdjustPaneSize { 'Down', 5 },
	},
	{
		key = 'q',
		mods = 'ALT',
		action = wt.action.CloseCurrentPane { confirm = false },
	},
	{
    		key = 'r',
    		mods = 'ALT',
    		action = wt.action.RotatePanes "Clockwise"
  	},
}

function kb.apply(cfg)
	cfg.leader = kb.leader
	cfg.keys = kb.keys
end

return kb
