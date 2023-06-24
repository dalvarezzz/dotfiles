return {
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
      return {
        servers = {
          astro = {},
          cssls = {},
          gopls = {},
          clangd = {},
          tsserver = {},
          dockerls = {},
          rust_analyzer = {},
          svelte = {},
          eslint = {},
          sqlls = {},
          lua_ls = {
            settings = {
              Lua = {
                completion = {
                  showWords = 'Disable'
                },
                diagnostics = {
                  globals = { 'vim' },
                },
                runtime = {
                  version = 'LuaJIT',
                },
                workspace = {
                  library = {
                    vim.api.nvim_get_runtime_file('', true),
                  }
                }
              },
            }
          }
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

      on_attach(function(client, buffer)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
        vim.keymap.set('n', '<leader>ff',
          function()
            vim.lsp.buf.format({ async = true })
          end, opts)
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
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          setup(server)
        end
      end
    end
  },
}
