local session_name = require('auto-session-library').current_session_name

require('lualine').setup {
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_c = {
      { 'filename', path = 1 },
      session_name
    },
    lualine_x = {
      {
        'filetype',
        icon_only = true
      }
    }
  }
}
