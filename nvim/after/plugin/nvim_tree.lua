local api = require('nvim-tree.api')

vim.keymap.set('n', '<leader>pt', api.tree.toggle)
