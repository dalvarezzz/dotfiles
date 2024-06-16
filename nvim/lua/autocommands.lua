-- Highligh yanked text
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank() end,
	group = highlight_group,
	pattern = '*',
})

-- Save the previous cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
	callback = function()
		local line = vim.fn.line([['"]])
		if line > 0 and line <= vim.fn.line('$') then
			vim.cmd([[normal! g`"]])
		end
	end,
})

-- Disable treesitter's textobject select and lookahead for dart files
vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { 'dart' },
	callback = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = 'dart',
			textobjects = {
				select = {
					enable = false,
					lookahead = false,
				},
			},
		})
	end,
})
