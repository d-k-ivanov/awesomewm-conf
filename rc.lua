--{{---| Standard   |----------------------------------------------------------------------------------------------------
awful               = require("awful")
gears               = require("gears")
awful.rules         = require("awful.rules")
                      require("awful.autofocus")
xresources          = require("beautiful.xresources")
                      --require("lgi").GLib.setenv("GDK_SCALE", "1.5", true)`
                      --require("lgi").GLib.setenv("QT_AUTO_SCREEN_SCALE_FACTOR", "1", true)
dpi                 = xresources.apply_dpi
awesome.set_preferred_icon_size(48)

--{{---| Extensions |----------------------------------------------------------------------------------------------------
local config_path   = awful.util.getdir("config")
package.path        = config_path .. "/?.lua;"                  .. package.path
package.path        = config_path .. "/?/init.lua;"             .. package.path
package.path        = config_path .. "/extensions/?.lua;"       .. package.path
package.path        = config_path .. "/extensions/?/?.lua;"     .. package.path
package.path        = config_path .. "/extensions/?/init.lua;"  .. package.path
package.path        = config_path .. "/widgets/?/?.lua;"        .. package.path
package.path        = config_path .. "/include/?.lua;"          .. package.path



--{{---| Theme      |----------------------------------------------------------------------------------------------------
beautiful           = require("beautiful")
                      beautiful.init(awful.util.getdir("config") .. "/theme/theme.lua")

--{{---| Menu       |----------------------------------------------------------------------------------------------------
awful.menu          = require("awful.menu")
appmenu             = require("appmenu")
menubar             = require("menubar")
freedesktop         = require("freedesktop")

--{{---| Handlers   |----------------------------------------------------------------------------------------------------
naughty             = require("naughty")
handler             = require("handler")
hotkeys_popup       = require("awful.hotkeys_popup").widget

--{{---| Extensions    |-------------------------------------------------------------------------------------------------
wibox               = require("wibox")
--{{---| Bashets    |----------------------------------------------------------------------------------------------------
bashets             = require("bashets")
--{{---| Vicious    |----------------------------------------------------------------------------------------------------
vicious             = require("vicious")
--{{---| Lain       |----------------------------------------------------------------------------------------------------
lain                = require("lain")
--{{---| Widgets    |----------------------------------------------------------------------------------------------------
                      require("widgets")
                      require("dropbox")
                      require("backlight")
                      require("keylock-icons")

--{{---| Helpers    |----------------------------------------------------------------------------------------------------
helpers             = require("helpers")

--{{---| Keycodes   |----------------------------------------------------------------------------------------------------
                      require("keycodes")

--{{---| Variables  |----------------------------------------------------------------------------------------------------
                      require("variables")

--{{---| Menu       |----------------------------------------------------------------------------------------------------
                      require("menu")

--{{---| Layouts    |----------------------------------------------------------------------------------------------------
                      require("layout")

--{{---| Bindings   |----------------------------------------------------------------------------------------------------
                      require("bindings")

--{{---| Rules      |----------------------------------------------------------------------------------------------------
                      require("rules")

--{{---| Signals    |----------------------------------------------------------------------------------------------------
                      require("signals")

--{{--| Autostart   |----------------------------------------------------------------------------------------------------
                      require("autostart")

--{{Xx-------------------------------------------------------------------------------------------------------------------
