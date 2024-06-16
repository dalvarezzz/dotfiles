return {
	'nvim-treesitter/nvim-treesitter',
	name = 'nvim-treesitter',
	build = ':TSUpdate',
	version = false,
	event = { 'BufReadPost', 'BufNewFile' },
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'm-demare/hlargs.nvim',
	},
	opts = {
		autotag = {
			enable = true,
		},
		textobjects = {
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					[']m'] = '@function.outer',
					[']]'] = { query = '@class.outer', desc = 'Next class start' },
				},
				goto_next_end = {
					[']M'] = '@function.outer',
					[']['] = '@class.outer',
				},
				goto_previous_start = {
					['[m'] = '@function.outer',
					['[['] = '@class.outer',
				},
				goto_previous_end = {
					['[M'] = '@function.outer',
					['[]'] = '@class.outer',
				},
			},
			lsp_interop = {
				enable = true,
				border = 'none',
				peek_definition_code = {
					['<leader>df'] = '@function.outer',
					['<leader>dF'] = '@class.outer',
				},
			},
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
				},
				selection_modes = {
					['@parameter.outer'] = 'v', -- charwise
					['@function.outer'] = 'V', -- linewise
					['@class.outer'] = '<c-v>', -- blockwise
				},
				include_surrounding_whitespace = true,
			},
		},
		ensure_installed = {
			'astro',
			'c',
			'css',
			'dart',
			'go',
			'html',
			'javascript',
			'json',
			'lua',
			'markdown',
			'python',
			'rust',
			'svelte',
			'tsx',
			'typescript',
			'vue',
		},
		highlight = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = 'gnn',
				node_incremental = 'grn',
				scope_incremental = 'grc',
				node_decremental = 'grm',
			},
		},
		indent = {
			enable = false,
		},
	},
	config = function(_, opts)
		if type(opts.ensure_installed) == 'table' then
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
			end, opts.ensure_installed)
		end
		require('nvim-treesitter.configs').setup(opts)
	end,
}
