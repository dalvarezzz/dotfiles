-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Autofocus window when its moved to another screen/tag
require("awful.autofocus")
-- require("awful.hotkeys_popup.keys")
require("src.theme.user_variables")
require("src.theme.init")

require("src.core.error_handling")
require("src.core.rules")
require("src.core.signals")

require("src.mappings.global_keys")

require("src.davo_bar.init")
