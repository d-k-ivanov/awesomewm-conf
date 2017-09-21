local awful                                 = require("awful")
local naughty                               = require("naughty")
local beautiful                             = require("beautiful")

--{{---| Naughty theme |----------------------------------------------------------------------------------------------------
naughty.config.presets.normal.font          = beautiful.notify_font
naughty.config.presets.normal.fg            = beautiful.notify_fg
naughty.config.presets.normal.bg            = beautiful.notify_bg
naughty.config.presets.normal.border_color  = beautiful.notify_border
naughty.config.presets.normal.opacity       = 0.8
naughty.config.presets.low.opacity          = 0.8
naughty.config.presets.critical.opacity     = 0.8


--{{---| Error handling |---------------------------------------------------------------------------------------------------
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true
        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end

--{{---| Battery notification |----------------------------------------------------------------------------------------------
local function trim(s)
  return s:find'^%s*$' and '' or s:match'^%s*(.*%S)'
end

local function bat_notification()

  local f_capacity = assert(io.open("/sys/class/power_supply/BAT0/capacity", "r"))
  local f_status = assert(io.open("/sys/class/power_supply/BAT0/status", "r"))

  local bat_capacity = tonumber(f_capacity:read("*all"))
  local bat_status = trim(f_status:read("*all"))

  if (bat_capacity <= 10 and bat_status == "Discharging") then
    naughty.notify({ title      = "Battery Warning"
      , text       = "Battery low! " .. bat_capacity .."%" .. " left!"
      , fg="#ff0000"
      --, bg="#deb887"
      , bg="#333"
      , timeout    = 1
      --, position   = "bottom_left"
      , position   = "top_right"
    })
  end
end

battimer = gears.timer({ timeout = 2 })
battimer:connect_signal("timeout", bat_notification)
battimer:start()

