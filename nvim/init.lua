local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('options')
require('autocommands')
require('remap')

require("lazy").setup("plugins")

local telescope = require('telescope')
local pickers = require('telescope.pickers')
local themes = require('telescope.themes')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local action_state = require("telescope.actions.state")
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local opts = {}

local my_other_picker = function()
  builtin.find_files({
    attach_mappings = function(bfr, map)
      map('i', '<CR>', function(bufnr)
        local selection = require('telescope.actions.state').get_selected_entry(bufnr)

        actions.close(bfr)

        local filename = selection.value

        builtin.lsp_dynamic_workspace_symbols({
          query = vim.fn.fnamemodify(filename, ':t'),
          cwd_only = false
        })
      end)
      return true
    end
  })
end

local my_picker = function()
  pickers.new(
    themes.get_dropdown(opts),
    {
      prompt_title = "Search Symbol in file",
      finder = finders.new_table {
        results = {
          "telescope",
          "lsp_config",
          "finders"
        }
      },
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          -- actions.close(prompt_bufnr)
          -- local selection = action_state.get_selected_entry()
          -- builtin.live_grep({
          --   prompt_title = "Live Grep: " .. selection[1],
          --   default_text = selection[1]
          -- })
          actions.close(prompt_bufnr)
        end)
        return true
      end,
    }
  ):find()
end

vim.api.nvim_create_user_command('PickPlanet', my_picker, {})
vim.api.nvim_create_user_command('PickLSPSymbol', my_other_picker, {})
