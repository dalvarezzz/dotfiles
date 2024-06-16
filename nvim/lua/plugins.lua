return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		config = function() vim.cmd.colorscheme('catppuccin-mocha') end,
	},
	'kyazdani42/nvim-web-devicons',
	{ 'numToStr/Comment.nvim', config = true },
	{ 'kylechui/nvim-surround', lazy = true },
	{
		'folke/todo-comments.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		config = true,
	},
	{
		'folke/tokyonight.nvim',
		opts = { style = 'moon' },
	},
	{
		'lewis6991/gitsigns.nvim',
		cond = vim.fn.isdirectory('.git') ~= 0,
		config = true,
	},
	{
		'goolord/alpha-nvim',
		config = function() require('alpha').setup(require('alpha.themes.startify').config) end,
	},
	'stevearc/dressing.nvim',
	'windwp/nvim-ts-autotag',
	{
		'yamatsum/nvim-cursorline',
		config = true,
	},
	{
		'norcalli/nvim-colorizer.lua',
		opts = {
			'lua',
			'html',
			'css',
		},
	},
	{
		'folke/zen-mode.nvim',
		opts = {
			window = {
				width = 0.75,
			},
		},
	},
	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	-- {
	--   dir = "~/projects/declassify.nvim",
	--   name = "declassify",
	--   config = function ()
	--     require('declassify').setup()
	--   end
	-- }
}
