return {
	'nvim-lualine/lualine.nvim',
	dependencies = 'kyazdani42/nvim-web-devicons',
	opts = {
		options = {
			theme = 'catppuccin',
		},
		sections = {
			lualine_c = {
				{ 'filename', path = 1 },
			},
			lualine_x = {
				{
					'filetype',
					icon_only = true,
				},
			},
		},
	},
}
