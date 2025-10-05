return {
	'nvim-lua/plenary.nvim',
	'rktjmp/lush.nvim',

	{
		'oncomouse/lushwal.nvim',
		cmd = { 'LushwalCompile' },
		dependencies = {
			{ 'rktjmp/lush.nvim' },
			{ 'rktjmp/shipwright.nvim' },
		},
		config = function()
			require('config.lushwal').defaults()
		end,
		lazy = false,
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('config.lualine').defaults()
		end
	},

	{
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
			return require('config.mason')
    end,
  },

	{
		'neovim/nvim-lspconfig',
		event = 'BufReadPost',
		config = function()
			require('config.lspconfig').defaults()
		end,
	},

	{
		"hrsh7th/nvim-cmp",
    event = "InsertEnter",

	}
}
