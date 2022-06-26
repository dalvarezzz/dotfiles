require('lualine').setup {
	options = {
		theme = 'nightfox'
	},
    sections = {
        lualine_c = {
            { 'filename', path = 1 }
        }
    }
}
