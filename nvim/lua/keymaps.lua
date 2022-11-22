vim.g.mapleader = ';'
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd> lua require('telescope.builtin').find_files()<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd> lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd> lua require('telescope.builtin').buffers()<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fp', "<cmd> lua require('telescope.builtin').projects()<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ft', "<cmd> lua require('telescope.builtin').treesitter()<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fx', "<cmd> lua require('telescope.builtin').marks()<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fz', "<cmd> lua require('telescope.builtin').lsp_references()<cr>",
  { noremap = true })

