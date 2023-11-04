-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

require('config.user_variables')
require('config.theme')
require('config.core')
require('config.mappings')
require('config.bar')
