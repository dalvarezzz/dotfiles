local options = {
  encoding       = 'utf-8',
  number         = true,
  showcmd        = true,
  showmode       = false,
  tabstop        = 2,
  shiftwidth     = 2,
  expandtab      = true,
  hidden         = true, -- avoid having to write changes before editing another buffer
  smartindent    = true,
  smartcase      = true, -- override the ignorecase option if the search contains any uppercase character
  ignorecase     = true, -- avoid having to write changes before editing another buffer
  gdefault       = true, -- appends "g" when replacing
  incsearch      = true,
  hlsearch       = true,
  cursorline     = true,
  relativenumber = true,
  termguicolors  = true,
  swapfile       = false,
  backup         = false,
  undofile       = true,
  wrap           = false,
  scrolloff      = 8,
  completeopt    = 'noselect',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Enable debug logging
-- vim.lsp.set_log_level("trace")

vim.g.mapleader = ' '
