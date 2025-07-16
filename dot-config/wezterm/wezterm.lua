local cfg = {}

-- Modules
local autocolors = require 'modules.autocolors'
autocolors.enable(cfg)

-- Config
local domains = require 'domains'
local kb = require 'keybinds'

kb.apply(cfg)
domains.apply(cfg)

return cfg
