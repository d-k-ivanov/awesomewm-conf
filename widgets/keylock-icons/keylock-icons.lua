--{{---| Backlight |-------------------------------------------------------------------------------------------------------
local awful   = require("awful")
local wibox   = require("wibox")
local gears   = require("gears")
local naughty = require("naughty")
local string  = require("string")
local watch   = require("awful.widget.watch")
local spawn   = require("awful.spawn")

local spacer0                 = wibox.widget.textbox()
                                spacer0:set_text(' ')

local function script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)"):gsub([[//]],[[/]])
end

local function isempty(s)
  return s == nil or s == ''
end

local widget_dir                  = script_path()

-- Commands
local key_status_cmd            = "bash -c 'xset -q | grep 00:'" -- 1>&2'
--local caps_lock_cmd           = "bash -c 'xset -q | grep 00:'"
--local num_lock_cmd            = "bash -c 'xset -q | grep 01:'"
--local scroll_lock_cmd         = "bash -c 'xset -q | grep 02:'"

-- Images
local caps_lock_on              = widget_dir .. "caps-lock-on.svg"
local caps_lock_off             = widget_dir .. "caps-lock-off.svg"
local num_lock_on               = widget_dir .. "num-lock-on.svg"
local num_lock_off              = widget_dir .. "num-lock-off.svg"
local scroll_lock_on            = widget_dir .. "scroll-lock-on.svg"
local scroll_lock_off           = widget_dir .. "scroll-lock-off.svg"

-- Boxes
local caps_lock_icon = wibox.widget {
  {
    id = "icon",
    image = caps_lock_off,
    --resize = false,
    widget = wibox.widget.imagebox,
  },
  layout = wibox.container.margin(_, _, _, 3),
  set_image = function(self, path)
    self.icon.image = path
  end
}
local num_lock_icon = wibox.widget {
  {
    id = "icon",
    image = num_lock_off,
    --resize = false,
    widget = wibox.widget.imagebox,
  },
  layout = wibox.container.margin(_, _, _, 3),
  set_image = function(self, path)
    self.icon.image = path
  end
}
local scroll_lock_icon = wibox.widget {
  {
    id = "icon",
    image = scroll_lock_off,
    --resize = false,
    widget = wibox.widget.imagebox,
  },
  layout = wibox.container.margin(_, _, _, 3),
  set_image = function(self, path)
    self.icon.image = path
  end
}

keylock_icons_widget = wibox.widget {
  caps_lock_icon,
--  spacer0,
  num_lock_icon,
--  spacer0,
  scroll_lock_icon,
  layout = wibox.layout.fixed.horizontal,
}

local function update_keylock_icons(widget, stdout, stderr, exitreason, exitcode)
  if not isempty(stderr) then
    naughty.notify({ title      = "Keylock-Icons widget error!"
      , text       = "Something went wrong: %\nError string: "..stderr
      , fg="#ff0000"
      --, bg="#deb887"
      , bg="#333"
      , timeout    = 1
      --, position   = "bottom_left"
      , position   = "top_right"
    })
    return
  end
  local caps_lock_status     = string.match(stdout, 'Caps Lock:%s+(%w+)')
  local num_lock_status      = string.match(stdout, 'Num Lock:%s+(%w+)')
  local scroll_lock_status   = string.match(stdout, 'Scroll Lock:%s+(%w+)')
  if string.find(caps_lock_status, "on", 1, true) then
    caps_lock_icon.image = caps_lock_on
  else
    caps_lock_icon.image = caps_lock_off
  end
  if string.find(num_lock_status, "on", 1, true) then
    num_lock_icon.image = num_lock_on
  else
    num_lock_icon.image = num_lock_off
  end
  if string.find(scroll_lock_status, "on", 1, true) then
    scroll_lock_icon.image = scroll_lock_on
  else
    scroll_lock_icon.image = scroll_lock_off
  end
end

-- TODO: Create signal handler to togle KeyLock Buttons
--caps_lock_icon:connect_signal("button::press", function(_,_,_,button)
--  if     (button == 1) then
--    awful.spawn.with_line_callback(key_status_cmd, {
--      stdout = function(line)
--        local caps_lock_status     = string.match(line, 'Caps Lock:%s+(%w+)')
--        if string.find(caps_lock_status, "on", 1, true) then
--          spawn.with_shell("sudo setleds -D -caps < /dev/console", false)
--        else
--          spawn.with_shell("sudo setleds -D +caps < /dev/console", false)
--        end
--      end
--    })
--    --naughty.notify { text = spawn(caps_lock_cmd, false), timeout = 5, hover_timeout = 0.5 }
--  end
--end)

keylock_icons_widget:connect_signal("button::press", function(_,_,_,button)
  spawn.easy_async(key_status_cmd, function(stdout, stderr, exitreason, exitcode) update_keylock_icons(keylock_icons_widget, stdout, stderr, exitreason, exitcode) end)
end)

watch(key_status_cmd, 1, update_keylock_icons, keylock_icons_widget)

