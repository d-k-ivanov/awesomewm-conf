--{{---| Dropbox |-------------------------------------------------------------------------------------------------------------
local awful   = require("awful")
local wibox   = require("wibox")
local gears   = require("gears")
local naughty = require("naughty")
local string  = require("string")
local watch   = require("awful.widget.watch")
local spawn   = require("awful.spawn")

local function script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)"):gsub([[//]],[[/]])
end

local widget_dir        = script_path()
local status_bin_cmd    = "dropbox-cli status"

local dropbox_status_blank    = widget_dir .. "dropboxstatus-blank.png"
local dropbox_status_busy2    = widget_dir .. "dropboxstatus-busy2.png"
local dropbox_status_busy1    = widget_dir .. "dropboxstatus-busy1.png"
local dropbox_status_idle     = widget_dir .. "dropboxstatus-idle.png"
local dropbox_status_logo     = widget_dir .. "dropboxstatus-logo.png"
local dropbox_status_x        = widget_dir .. "dropboxstatus-x.png"
local dropbox_loading_icon    = dropbox_status_busy1
local dropbox_number          = 1

dropbox_widget          = wibox.widget {
{
id      = "icon",
image   = dropbox_status_logo,
--resize = false,
widget  = wibox.widget.imagebox,
  },
layout    = wibox.container.margin(_, _, _, 3),
set_image = function(self, path)
    self.icon.image = path
  end
}

-- Section for Watcher
local function update(widget, stdout, stderr, exitreason, exitcode)

-- Section for Timer and Updater
--function update(widget)

  --local fd = io.popen(status_bin_cmd)

  -- Section for Timer and Updater
  --local status = fd:read("*all")
  -- Section for Watcher
  local status = stdout

  if string.find(status, "date", 1, true) then
    widget:set_image(dropbox_status_idle)
  elseif string.find(status, "Syncing", 1, true) then
    widget:set_image(dropbox_loading_icon)
  elseif string.find(status, "Downloading file list", 1, true) then
    widget:set_image(dropbox_loading_icon)
  elseif string.find(status, "Connecting", 1, true) then
    widget:set_image(dropbox_loading_icon)
  elseif string.find(status, "Starting", 1, true) then
    widget:set_image(dropbox_loading_icon)
  elseif string.find(status, "Indexing", 1, true) then
    widget:set_image(dropbox_loading_icon)
  elseif string.find(status, "Dropbox isn't running", 1, true) then
    widget:set_image(dropbox_status_x)
  end

  if dropbox_number == 1 then
    dropbox_number = 2
    dropbox_loading_icon = dropbox_status_busy2
  else
    dropbox_number = 1
    dropbox_loading_icon = dropbox_status_busy1
  end

end

-- Version with Wacher
dropbox_widget:connect_signal("button::press", function(_,_,_,button)
  if      (button == 1) then spawn("xdg-open https://dropbox.com", false)
--  elseif  (button == 3) then naughty.notify { text = script_path(), timeout = 5, hover_timeout = 0.5 }
  end
  spawn.easy_async(status_bin_cmd, function(stdout, stderr, exitreason, exitcode) update(dropbox_widget, stdout, stderr, exitreason, exitcode) end)
end)

watch(status_bin_cmd, 1, update, dropbox_widget)

-- Version with Timer and Updater
--update(dropbox_widget)

-- Use a prime number to avoid running at the same time as other commands
--mytimer = gears.timer({ timeout = 2 })
--mytimer:connect_signal("timeout", function () update(dropbox_widget)                        end)
--mytimer:connect_signal("timeout", function () update(dropbox_widget)                        end)
--mytimer:start()

--do
--  dropbox_widget:buttons(awful.util.table.join(
--    awful.button({ }, 1, function() awful.spawn("xdg-open https://dropbox.com", {})      end)
--    -- DEBUG
--    --awful.button({ }, 3, function() naughty.notify { text = script_path(), timeout = 5, hover_timeout = 0.5 }      end)
--  ))
--end
