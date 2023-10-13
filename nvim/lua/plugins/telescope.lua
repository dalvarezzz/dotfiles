return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = 'nvim-lua/plenary.nvim',
  keys = {
    {
      '<C-p>',
      function(opts)
        require('telescope.builtin').git_files(opts)
      end,
      "Search git files"
    },
    { '<leader>pf',
      function(opts)
        require('telescope.builtin').find_files(opts)
      end,
      "Search files in the current workdir"
    },
    {
      '<leader>ps',
      function(opts)
        require('telescope.builtin').live_grep(opts)
      end
    },
    {
      '<leader>ss',
      function(opts)
        require('telescope.builtin').treesitter(opts)
      end,
      "Search tree-sitter symbols"
    },
    {
      '<leader>pr',
      function(opts)
        require('telescope.builtin').lsp_references(opts)
      end
    },
    "Search LSP references"
  }
}
