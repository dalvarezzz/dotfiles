local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(client, bufnr)
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
end

local servers = {
  astro = {},
  gopls = {},
  tsserver = {
    root_dir = nvim_lsp.util.root_pattern("package.json")
  },
  dockerls = {},
  rust_analyzer = {},
  svelte = {},
  vls = {},
  eslint = {
    root_dir = nvim_lsp.util.root_pattern("package.json"),
  },
  denols = {
    root_dir = nvim_lsp.util.root_pattern("deno.json"),
    settings = {
      deno = {
        enable = true,
        suggest = {
          imports = {
            hosts = {
              ["https://crux.land"] = true,
              ["https://deno.land"] = true,
              ["https://x.nest.land"] = true
            }
          }
        },
      },
    },
  },
  clangd = {},
  sumneko_lua = {
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
for server, config in pairs(servers) do
  nvim_lsp[server].setup(vim.tbl_deep_extend('force', {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }, config))
end
