---------------------------
-- Default awesome theme --
---------------------------

local theme_assets                              = require("beautiful.theme_assets")
local xresources                                = require("beautiful.xresources")
local dpi                                       = xresources.apply_dpi
local awful                                     = require("awful")

local gfs                                       = require("gears.filesystem")
local themes_path                               = gfs.get_themes_dir()

Theme                                           = {}

Theme.font                                      = "sans 8"

Theme.bg_normal                                 = "#222222"
Theme.bg_focus                                  = "#535d6c"
Theme.bg_urgent                                 = "#ff0000"
Theme.bg_minimize                               = "#444444"
Theme.bg_systray                                = Theme.bg_normal

Theme.fg_normal                                 = "#aaaaaa"
Theme.fg_focus                                  = "#ffffff"
Theme.fg_urgent                                 = "#ffffff"
Theme.fg_minimize                               = "#ffffff"

Theme.useless_gap                               = dpi(3)
Theme.border_width                              = dpi(1)
Theme.border_normal                             = "#000000"
Theme.border_focus                              = "#535d6c"
Theme.border_marked                             = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size                       = dpi(4)
Theme.taglist_squares_sel                       = theme_assets.taglist_squares_sel(
    taglist_square_size, Theme.fg_normal
)
Theme.taglist_squares_unsel                     = theme_assets.taglist_squares_unsel(
    taglist_square_size, Theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
Theme.menu_submenu_icon                         = themes_path .. "default/submenu.png"
Theme.menu_height                               = dpi(15)
Theme.menu_width                                = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
Theme.titlebar_close_button_normal              = themes_path .. "default/titlebar/close_normal.png"
Theme.titlebar_close_button_focus               = themes_path .. "default/titlebar/close_focus.png"

Theme.titlebar_minimize_button_normal           = themes_path .. "default/titlebar/minimize_normal.png"
Theme.titlebar_minimize_button_focus            = themes_path .. "default/titlebar/minimize_focus.png"

Theme.titlebar_ontop_button_normal_inactive     = themes_path .. "default/titlebar/ontop_normal_inactive.png"
Theme.titlebar_ontop_button_focus_inactive      = themes_path .. "default/titlebar/ontop_focus_inactive.png"
Theme.titlebar_ontop_button_normal_active       = themes_path .. "default/titlebar/ontop_normal_active.png"
Theme.titlebar_ontop_button_focus_active        = themes_path .. "default/titlebar/ontop_focus_active.png"

Theme.titlebar_sticky_button_normal_inactive    = themes_path .. "default/titlebar/sticky_normal_inactive.png"
Theme.titlebar_sticky_button_focus_inactive     = themes_path .. "default/titlebar/sticky_focus_inactive.png"
Theme.titlebar_sticky_button_normal_active      = themes_path .. "default/titlebar/sticky_normal_active.png"
Theme.titlebar_sticky_button_focus_active       = themes_path .. "default/titlebar/sticky_focus_active.png"

Theme.titlebar_floating_button_normal_inactive  = themes_path .. "default/titlebar/floating_normal_inactive.png"
Theme.titlebar_floating_button_focus_inactive   = themes_path .. "default/titlebar/floating_focus_inactive.png"
Theme.titlebar_floating_button_normal_active    = themes_path .. "default/titlebar/floating_normal_active.png"
Theme.titlebar_floating_button_focus_active     = themes_path .. "default/titlebar/floating_focus_active.png"

Theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
Theme.titlebar_maximized_button_focus_inactive  = themes_path .. "default/titlebar/maximized_focus_inactive.png"
Theme.titlebar_maximized_button_normal_active   = themes_path .. "default/titlebar/maximized_normal_active.png"
Theme.titlebar_maximized_button_focus_active    = themes_path .. "default/titlebar/maximized_focus_active.png"

-- Theme.wallpaper = "/home/ddvlzsz/Pictures/tile.png"
-- Theme.wallpaper = User_variables.wallpaper
-- theme.wallpaper_cmd = { "/usr/bin/nitrogen --restore" }

-- You can use your own layout icons like this:
Theme.layout_fairh                              = themes_path .. "default/layouts/fairhw.png"
Theme.layout_fairv                              = themes_path .. "default/layouts/fairvw.png"
Theme.layout_floating                           = themes_path .. "default/layouts/floatingw.png"
Theme.layout_magnifier                          = themes_path .. "default/layouts/magnifierw.png"
Theme.layout_max                                = themes_path .. "default/layouts/maxw.png"
Theme.layout_fullscreen                         = themes_path .. "default/layouts/fullscreenw.png"
Theme.layout_tilebottom                         = themes_path .. "default/layouts/tilebottomw.png"
Theme.layout_tileleft                           = themes_path .. "default/layouts/tileleftw.png"
Theme.layout_tile                               = themes_path .. "default/layouts/tilew.png"
Theme.layout_tiletop                            = themes_path .. "default/layouts/tiletopw.png"
Theme.layout_spiral                             = themes_path .. "default/layouts/spiralw.png"
Theme.layout_dwindle                            = themes_path .. "default/layouts/dwindlew.png"
Theme.layout_cornernw                           = themes_path .. "default/layouts/cornernww.png"
Theme.layout_cornerne                           = themes_path .. "default/layouts/cornernew.png"
Theme.layout_cornersw                           = themes_path .. "default/layouts/cornersww.png"
Theme.layout_cornerse                           = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
Theme.awesome_icon                              = theme_assets.awesome_icon(
    Theme.menu_height, Theme.bg_focus, Theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
Theme.icon_theme                                = nil

-- return theme

awful.layout.layouts                            = User_variables.layouts

return Theme
