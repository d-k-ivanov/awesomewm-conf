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

  if args[1] == "↯" then
    baticon:set_image(battery_charging_full)
  elseif args[1] == "−" then
    if bat_charge > 93 then
      baticon:set_image(beautiful.battery_5)
    elseif bat_charge <= 93 and bat_charge > 77 then
      baticon:set_image(beautiful.battery_4)
    elseif bat_charge <= 77 and bat_charge > 49 then
      baticon:set_image(beautiful.battery_3)
    elseif bat_charge <= 49 and bat_charge > 28 then
      baticon:set_image(beautiful.battery_2)
    elseif bat_charge <= 28 and bat_charge > 7 then
      baticon:set_image(beautiful.battery_1)
    elseif bat_charge <= 7 then
      baticon:set_image(beautiful.battery_empty)
    end
  else
    if bat_charge > 93 then
      baticon:set_image(beautiful.battery_charging_5)
    elseif bat_charge <= 93 and bat_charge > 77 then
      baticon:set_image(beautiful.battery_charging_4)
    elseif bat_charge <= 77 and bat_charge > 49 then
      baticon:set_image(beautiful.battery_charging_3)
    elseif bat_charge <= 49 and bat_charge > 28 then
      baticon:set_image(beautiful.battery_charging_2)
    elseif bat_charge <= 28 and bat_charge > 7 then
      baticon:set_image(beautiful.battery_charging_1)
    elseif bat_charge <= 7 then
      baticon:set_image(beautiful.battery_charging_empty)
    end
  end

  return "<span fgcolor='orange'>" .. args[2] .. "%</span>"
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
  elseif bat_state == "−" then
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
  --awful.button({ }, 1, function () naughty.notify { text = bat_state , timeout = 5, hover_timeout = 0.5 } end),
  awful.button({ }, 3, power_menu)

))
baticon:buttons(batpct:buttons())

batt = wibox.widget.textbox()
vicious.register(batt, vicious.widgets.bat, "Batt: $2% Rem: $3", 61, "BAT0")
-- End Battery}}}


-- Network usage widget
-- Initialize widget, use widget({ type = "textbox" }) for awesome < 3.5
lan_usage = wibox.widget.textbox()
-- Register widget
vicious.register(lan_usage, vicious.widgets.net, '<span color="#CC9393">${enp6s0 down_kb}</span> <span color="#7F9F7F">${enp6s0 up_kb}</span>', 3)

wifi_usage = wibox.widget.textbox()
-- Register widget
vicious.register(wifi_usage, vicious.widgets.net, '<span color="#CC9393">${wlp3s0 down_kb}</span> <span color="#7F9F7F">${wlp3s0 up_kb}</span>', 3)
-- End Network usage}}}


-- {{{ VOLUME
-- Cache
vicious.cache(vicious.widgets.volume)
-- Icon
volicon = wibox.widget.imagebox()
-- Volume %
volpct = wibox.widget.textbox()
vicious.register(volpct, vicious.widgets.volume, function(widget, args)
  vol_level = args[1]
  vol_state = args[2]

  if args[2] == "♩" then
    volicon:set_image(beautiful.volume_muted)
  else
    if vol_level > 75 then
      volicon:set_image(beautiful.volume_high)
    elseif vol_level <= 75 and vol_level > 45 then
      volicon:set_image(beautiful.volume_medium)
    elseif vol_level <= 45 and vol_level > 20 then
      volicon:set_image(beautiful.volume_low)
    elseif vol_level <= 20 then
      volicon:set_image(beautiful.volume_off)
    end
   end

  return "<span fgcolor='orange'>" .. args[1] .. "%</span>"
end, nil, "Master")

-- Buttons
volicon:buttons(awful.util.table.join(
  awful.button({ }, 1, function() awful.util.spawn_with_shell("amixer -q set Master toggle") end),
  awful.button({ }, 3, function() awful.util.spawn("gnome-alsamixer") end),
  awful.button({ }, 4, function() awful.util.spawn_with_shell("amixer -q set Master 1%+ unmute") end),
  awful.button({ }, 5, function() awful.util.spawn_with_shell("amixer -q set Master 1%- unmute") end)
))
  
volpct:buttons(volicon:buttons())
volspace:buttons(volicon:buttons())
-- End VOLUME }}}


-- CLOCK WIDGET
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- END CLOCK
