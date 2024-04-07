-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')

local awful = require('awful')
local home = os.getenv('HOME')

user = {
	layouts = {
		awful.layout.suit.floating,
		awful.layout.suit.tile,
		awful.layout.suit.fair,
	},
	wallpaper = home .. '/Pictures/tile.png',
	web_browser = 'firefox-developer-edition',
	terminal = 'alacritty',
	editor = os.getenv('EDITOR') or 'nvim',
	modkey = 'Mod4',
	font = {
		regular = 'JetBrainsMono 9',
		bold = '',
		extrabold = '',
	},
}

require('theme')
require('core')
require('keys')
require('bar')
