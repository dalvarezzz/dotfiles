-- Highligh yanked text
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Format on write
-- local format_on_write_group = vim.api.nvim_create_augroup('FormatOnWrite', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   command = 'lua vim.lsp.buf.format({ async = false })',
--   group = format_on_write_group,
--   pattern = '*'
-- })

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function ()
    local line = vim.fn.line([['"]])
    if line > 0 and line <= vim.fn.line("$") then
      vim.cmd([[normal! g`"]])
    end
  end
})
