require('lualine').setup {
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_c = {
      { 'filename', path = 1 },
    },
    lualine_x = {
      {
        'filetype',
        icon_only = true
      }
    }
  }
}
