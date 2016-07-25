-- Standard awesome library
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local vicious = require("vicious")
local naughty = require("naughty")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(awful.util.getdir("config") .. "/themes/default/theme.lua")

-- Main spacer
spacer       = wibox.widget.textbox()
spacer:set_text(' | ')

-- Spacers
volspace = wibox.widget.textbox()
volspace:set_text(" ")

-- {{{ BATTERY
-- Battery attributes

local bat_state  = ""
local bat_charge = 0
local bat_time   = 0
local blink      = true

-- Icon
baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.battery_full)

-- Charge %
batpct = wibox.widget.textbox()
vicious.register(batpct, vicious.widgets.bat, function(widget, args)
  bat_state  = args[1]
  bat_charge = args[2]
  bat_time   = args[3]

  if args[1] == "-" then
    if bat_charge > 70 then
      baticon:set_image(beautiful.widget_batfull)
    elseif bat_charge > 30 then
      baticon:set_image(beautiful.widget_batmed)
    elseif bat_charge > 10 then
      baticon:set_image(beautiful.widget_batlow)
    else
      baticon:set_image(beautiful.widget_batempty)
    end
  else
    --if args[1] == "+" then
      baticon:set_image(beautiful.battery_charging_1)
      baticon:set_image(beautiful.battery_charging_2)
      baticon:set_image(beautiful.battery_charging_3)
      baticon:set_image(beautiful.battery_charging_4)
      baticon:set_image(beautiful.battery_charging_5)
    --else
    --baticon:set_image(beautiful.charging_full)
    --end
  end

  return args[2] .. "%"
end, nil, "BAT0")

-- Buttons
function popup_bat()
  local state = ""
  if bat_state == "↯" then
    state = "Full"
  elseif bat_state == "↯" then
    state = "Charged"
  elseif bat_state == "+" then
    state = "Charging"
  elseif bat_state == "-" then
    state = "Discharging"
  elseif bat_state == "⌁" then
    state = "Not charging"
  else
    state = "Unknown"
  end

  naughty.notify { text = "Charge : " .. bat_charge .. "%\nState  : " .. state ..
    " (" .. bat_time .. ")", timeout = 5, hover_timeout = 0.5 }
end

function power_menu()
  local prog="gnome-control-center power"
  awful.util.spawn(prog)
end

batpct:buttons(awful.util.table.join(
  awful.button({ }, 1, popup_bat),
  awful.button({ }, 3, power_menu)
))
baticon:buttons(batpct:buttons())

--Battery Widget
batt = wibox.widget.textbox()
vicious.register(batt, vicious.widgets.bat, "Batt: $2% Rem: $3", 61, "BAT0")

-- End Battery}}}
--
-- Network usage widget
-- Initialize widget, use widget({ type = "textbox" }) for awesome < 3.5
lan_usage = wibox.widget.textbox()
-- Register widget
vicious.register(lan_usage, vicious.widgets.net, '<span color="#CC9393">${enp6s0 down_kb}</span> <span color="#7F9F7F">${enp6s0 up_kb}</span>', 3)

wifi_usage = wibox.widget.textbox()
-- Register widget
vicious.register(wifi_usage, vicious.widgets.net, '<span color="#CC9393">${wlp3s0 down_kb}</span> <span color="#7F9F7F">${wlp3s0 up_kb}</span>', 3)

-- End Network usage}}}
--

-- {{{ VOLUME
-- Cache
vicious.cache(vicious.widgets.volume)
--
-- Icon
volicon = wibox.widget.imagebox()
volicon:set_image(beautiful.widget_volume)
--
-- Volume %
volpct = wibox.widget.textbox()
vicious.register(volpct, vicious.widgets.volume, "$1%", nil, "Master")
--
-- Buttons
volicon:buttons(awful.util.table.join(
  awful.button({ }, 1, function() awful.util.spawn_with_shell("amixer -q set Master toggle") end),
  awful.button({ }, 3, function() awful.util.spawn("gnome-alsamixer") end),
  awful.button({ }, 4, function() awful.util.spawn_with_shell("amixer -q set Master 5%+ unmute") end),
  awful.button({ }, 5, function() awful.util.spawn_with_shell("amixer -q set Master 5%- unmute") end)
))
  
volpct:buttons(volicon:buttons())
volspace:buttons(volicon:buttons())
-- End Volume }}}