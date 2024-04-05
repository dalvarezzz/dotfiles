return {
  { "folke/neodev.nvim", opts = {} },
  {
    'j-hui/fidget.nvim',
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'RishabhRD/nvim-lsputils',
      'ray-x/lsp_signature.nvim',
      'j-hui/fidget.nvim',
      'lukas-reineke/indent-blankline.nvim',
    },
    opts = function()
      require('neodev').setup()
      local nvim_lsp = require('lspconfig')

      return {
        servers = {
          astro = {},
          clangd = {},
          cssls = {},
          dockerls = {},
          eslint = {
            root_dir = nvim_lsp.util.root_pattern("package.json")
          },
          gopls = {},
          jsonls = {},
          lua_ls = {},
          rust_analyzer = {},
          sqlls = {},
          svelte = {},
          tsserver = {
            root_dir = nvim_lsp.util.root_pattern("package.json"),
            single_file_support = false
          },
        }
      }
    end,
    config = function(_, opts)
      local function on_attach(on_attach)
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
          end,
        })
      end

      on_attach(function(_, buffer)
        local options = { buffer = buffer, remap = false }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, options)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, options)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, options)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, options)
        vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, options)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, options)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, options)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, options)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, options)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, options)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, options)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, options)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, options)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, options)
        vim.keymap.set('n', '<leader>ff',
          function()
            vim.lsp.buf.format({ async = true })
          end, options)
      end)

      local servers = opts.servers
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities(),
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        require("lspconfig")[server].setup(server_opts)
      end

      for server, server_opts in pairs(servers) do
        -- if server_opts then
        -- server_opts = server_opts == true and {} or server_opts
        setup(server)
        -- end
      end
    end
  },
}
