return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = 'nvim-lua/plenary.nvim',
  keys = {
    {
      '<C-p>',
      function()
        require('telescope.builtin').git_files()
      end,
      "Search git files"
    },
    { '<leader>pf',
      function()
        require('telescope.builtin').find_files()
      end,
      "Search files in the current workdir"
    },
    {
      '<leader>ps',
      function()
        require('telescope.builtin').live_grep()
      end
    },
    {
      '<leader>ss',
      function()
        require('telescope.builtin').treesitter()
      end,
      "Search tree-sitter symbols"
    },
    {
      '<leader>pr',
      function()
        require('telescope.builtin').lsp_references()
      end
    },
    "Search LSP references"
  }
}
