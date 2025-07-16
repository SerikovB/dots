local domains = {}
local home_dir = os.getenv('HOME')

-- UNIX
domains.unix = {
	{
		name = 'unix',
		socket_path = home_dir .. '/.local/share/wezterm/socket',
		no_serve_automatically = false,
		skip_permissions_check = false,
	},
}

-- Connect to UNIX domain at startup
domains.args = {
	'connect',
	'unix'
}

function domains.apply(cfg)
	cfg.unix_domains = domains.unix
	cfg.ssh_domains = domains.ssh
	cfg.tls_clients = domains.tls_cli
	cfg.tls_servers = domains.tls_srv
	cfg.default_gui_startup_args = domains.args
end

return domains
