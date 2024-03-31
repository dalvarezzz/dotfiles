-- https://github.com/FeiyouG/commander.nvim
return {
  "FeiyouG/commander.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { "<leader>fc", "<CMD>Telescope commander<CR>", mode = "n" }
  },
  config = function()
    local commander = require('commander')
    commander.add({
      {
        desc = "Find telescope files",
        cmd = '<CMD>Telescope find_files<CR>',
      }
    })
    commander.setup({
      integration = {
        telescope = {
          enable = true
        },
      }
    })
  end
}
