local awful = require("awful")
local home = os.getenv("HOME")

User_variables = {
    layouts = {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.fair
    },
    wallpaper = home .. "/Pictures/tile.png",
    terminal = "alacritty",
    modkey = "Mod4",
    font = {
        regular = "",
        bold = "",
        extrabold = ""
    }
}
