--{{---| Dropbox |-------------------------------------------------------------------------------------------------------------
function script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)"):gsub([[//]],[[/]])
end

local widget_dir        = script_path()
local status_bin_cmd    = "dropbox-cli status"


-- Textbox version
-- dropbox_widget = wibox.widget.textbox()
--
-- function update(widget)
--   local fd = io.popen(status_bin_cmd)
--   local status = fd:read("*all")
--   if string.find(status, "date", 1, true) then
--     status = "DB: ✔"
--   elseif string.find(status, "Syncing", 1, true) then
--     status = "DB: ⇅"
--   elseif string.find(status, "Downloading file list", 1, true) then
--     status = "DB: ↺"
--   elseif string.find(status, "Connecting", 1, true) then
--     status = "DB: ↺"
--   elseif string.find(status, "Starting", 1, true) then
--     status = "DB: ↺"
--   elseif string.find(status, "Indexing", 1, true) then
--     status = "DB: ↺"
--   elseif string.find(status, "Dropbox isn't running", 1, true) then
--     status = "DB: x"
--   end
--   widget:set_markup(status)
-- end

-- Imagebox version

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

function update(widget)
  local fd = io.popen(status_bin_cmd)
  local status = fd:read("*all")
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

update(dropbox_widget)

-- Use a prime number to avoid running at the same time as other commands
mytimer = gears.timer({ timeout = 1 })
mytimer:connect_signal("timeout", function () update(dropbox_widget) end)
mytimer:start()

do
  dropbox_widget:buttons(awful.util.table.join(
    awful.button({ }, 1, function() awful.util.spawn_with_shell("xdg-open https://dropbox.com")      end)
    -- DEBUG
    --awful.button({ }, 3, function() naughty.notify { text = script_path(), timeout = 5, hover_timeout = 0.5 }      end)
  ))
end
