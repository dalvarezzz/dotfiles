local builtin = require('telescope.builtin')

return {
  'nvim-telescope/telescope.nvim',
  keys = {
    { '<C-p>',      builtin.git_files,      desc = "Search git files" },
    { '<leader>pf', builtin.find_files,     desc = "Search files in the current workdir" },
    { '<leader>ps', builtin.live_grep,      desc = "Live grep search" },
    { '<leader>ss', builtin.treesitter,     desc = "Search tree-sitter symbols" },
    { '<leader>pr', builtin.lsp_references, desc = "Search LSP references" },
  }
}
