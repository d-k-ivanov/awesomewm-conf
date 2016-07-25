-- Standard awesome library
local awful = require("awful")
local naughty = require("naughty")


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end
--
-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}
--
-- Battery notification [created by bpdp]
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
      , bg="#deb887"
      , timeout    = 15
      , position   = "bottom_left"
    })
  end
end

battimer = timer({timeout = 120})
battimer:connect_signal("timeout", bat_notification)
battimer:start()
--  }}} END of Battery notofication
--