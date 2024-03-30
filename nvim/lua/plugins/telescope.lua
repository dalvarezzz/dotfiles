return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = 'nvim-lua/plenary.nvim',
  config = {
    defaults = {
      file_ignore_patterns = { "node_modules" }
    }
  },
  keys = {
    {
      '<C-p>',
      function(opts)
        require('telescope.builtin').buffers(opts)
      end,
      "Search previous used buffers"
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
      end,
      "Search live grep"
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
      end,
      "Search LSP references"
    },
    {
      '<leader>pq',
      function(opts)
        require('telescope.builtin').diagnostics(opts)
      end,
      "Search diagnostics"
    },
    {
      '<leader>po',
      function(opts)
        require('telescope.builtin').lsp_workspace_symbols(opts)
      end,
      "Search workspace LSP symbols"
    },
    {
      '<leader>pp',
      function(opts)
        require('telescope.builtin').resume(opts)
      end,
      "Resume previous search"
    }
  }
}
