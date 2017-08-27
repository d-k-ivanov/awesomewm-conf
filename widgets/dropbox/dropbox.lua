--{{---| Dropbox |-------------------------------------------------------------------------------------------------------------
local config_dir        = gears.filesystem.get_dir("config")
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

local dropbox_status_blank    = config_dir .. "widgets/dropbox/dropboxstatus-blank.png"
local dropbox_status_busy2    = config_dir .. "widgets/dropbox/dropboxstatus-busy2.png"
local dropbox_status_busy1    = config_dir .. "widgets/dropbox/dropboxstatus-busy1.png"
local dropbox_status_idle     = config_dir .. "widgets/dropbox/dropboxstatus-idle.png"
local dropbox_status_logo     = config_dir .. "widgets/dropbox/dropboxstatus-logo.png"
local dropbox_status_x        = config_dir .. "widgets/dropbox/dropboxstatus-x.png"
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
-- Imagebox version
update(dropbox_widget)

-- Use a prime number to avoid running at the same time as other commands
mytimer = gears.timer({ timeout = 1 })
mytimer:connect_signal("timeout", function () update(dropbox_widget) end)
mytimer:start()
