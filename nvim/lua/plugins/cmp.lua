return {
	{
		'L3MON4D3/LuaSnip',
		event = 'VeryLazy',
	},
	{
		'echasnovski/mini.pairs',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'saadparwaiz1/cmp_luasnip',
		},
		opts = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')
			return {
				completion = {
					completeop = 'menu,menuone,noinsert',
				},
				snippet = {
					expand = function(args) luasnip.lsp_expand(args.body) end,
				},
				mapping = {
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					-- NOTE: these settings are temporary to test how Luasnip works
					-- ['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<CR>'] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
					-- NOTE: end
					['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
					['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'nvim_lua' },
				}, {
					name = 'buffer',
				}),
			}
		end,
	},
}
