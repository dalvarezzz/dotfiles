local awful = require("awful")
local home = os.getenv("HOME")

User_variables = {
  layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.fair
  },
  wallpaper = home .. "/Pictures/tile.png",
  web_browser = "firefox-developer-edition",
  terminal = "alacritty",
  editor = os.getenv("EDITOR") or "nvim",
  modkey = "Mod4",
  font = {
    regular = "",
    bold = "",
    extrabold = ""
  }
}
