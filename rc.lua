--{{---| Standard |----------------------------------------------------------------------------
local awful       = require("awful")

--{{---| Parse config |----------------------------------------------------------------------------
local config_path = awful.util.getdir("config")
package.path      = config_path .. "/?.lua;"                  .. package.path
package.path      = config_path .. "/?/init.lua;"             .. package.path
package.path      = config_path .. "/extensions/?.lua;"       .. package.path
package.path      = config_path .. "/extensions/?/?.lua;"     .. package.path
package.path      = config_path .. "/extensions/?/init.lua;"  .. package.path


local gears       = require("gears")
awful.rules       = require("awful.rules")
                    require("awful.autofocus")


--{{---| Theme |------------------------------------------------------------------------------------
local beautiful   = require("beautiful")
beautiful.init(awful.util.getdir("config") .. "/theme/theme.lua")
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

--{{---| Menu |----------------------------------------------------------------------------
awful.menu        = require("awful.menu")
local xdg_menu    = require("archmenu")
local menubar     = require("menubar")

--{{---| Widgets |----------------------------------------------------------------------------
local wibox       = require("wibox")
local widgets     = require("widgets")

--{{---| Notificaton and error handling |----------------------------------------------------------------------------
local handler     = require("handler")

--{{---| Bashets |----------------------------------------------------------------------------
local bashets     = require("bashets")

--{{---| Variables |--------------------------------------------------------------------------------
modkey            = "Mod4"
terminal          = "sakura"
terminal2         = "terminator"
editor            = os.getenv("EDITOR") or "vim"
editor_cmd        = terminal .. " -e " .. editor
browser           = "firefox"
fme               = "spacefm"
fms               = "gnome-commander"
fmx               = "pcmanfm"
stmux             = terminal .. " -e tmux -2"

--{{---| Session variables |--------------------------------------------------------------------------------
local fme_started = false
local fms_started = false
local fmx_started = false


--{{---| Table of layouts |-------------------------------------------------------------------------
local layouts     =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    awful.layout.suit.magnifier,
    awful.layout.suit.max
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max.fullscreen
    
}

--{{---| Tags |-------------------------------------------------------------------------------------
tags              = 
{
  names           = { 
                      "IDE", "Web", "Files", "MSG",
                      "PAC", "SQL", "Vim", "Office", "Other" 
                    },
  layout          = { 
                      layouts[5], layouts[5], layouts[3], layouts[3],
                      layouts[5], layouts[5], layouts[5], layouts[1], layouts[3]
                    }
}

for s = 1, screen.count() do
    -- Each screen has its own tag table
    -- tags[s] = awful.tag({1, 2, 3, 4, 5}, s, tags.layout)
    tags[s] = awful.tag(tags.names, s, tags.layout)
end

--{{---| Menu |-------------------------------------------------------------------------------------
-- do not use letters, which shadow access key to menu entry
awful.menu.menu_keys.down   = { "Down", ".", ">", "'", "\"", }
awful.menu.menu_keys.up     = {  "Up", ",", "<", ";", ":", }
awful.menu.menu_keys.enter  = { "Right", "]", "}", "=", "+", }
awful.menu.menu_keys.back   = { "Left", "[", "{", "-", "_", }
awful.menu.menu_keys.exec   = { "Return", "Space", }
awful.menu.menu_keys.close  = { "Escape", "BackSpace", }

-- Terminator
--myawesomemenu = {
--   { "manual", terminal .. ' -e "source ~/.bashrc; man awesome"' },
--   { "edit config", terminal .. ' -e "source ~/.bashrc;' .. editor .. " " .. awesome.conffile .. '"' },
--   { "reload", awesome.restart },
--   { "reboot", "sudo reboot" },
--   { "quit", awesome.quit }
--}
-- Sakura
myawesomemenu = {
  { "Read manual",            terminal .. ' -e "man awesome"',                                  beautiful.manual_icon     },
  { "Edit Awesome config",    terminal .. ' -e "' .. editor .. " " .. awesome.conffile .. '"',  beautiful.edit_icon       },
  { "Reload",                 awesome.restart,                                                  beautiful.reload_icon     },
  { "Quit",                   awesome.quit,                                                     beautiful.quit_icon       },
  { "Hibernate",              "sudo pm-hibernate",                                              beautiful.hibernate_icon  },
  { "Reboot",                 "sudo reboot",                                                    beautiful.restart_icon    },
  { "Shutdown",               "sudo shutdown -h 0",                                             beautiful.shutdown_icon   }
}


mymainmenu = awful.menu({ items = { 
  { "Awesome",          myawesomemenu,                                                          beautiful.awesome_icon    },
  { "Applications",     xdgmenu,                                                                beautiful.packages_icon   },
  { "Open Sakura",      terminal,                                                               beautiful.terminal_icon   },
  { "Open Terminator",  terminal2,                                                              beautiful.terminator_icon }
}
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal  -- Set the terminal for applications that require it
app_folders = { "/usr/share/applications/", "~/.local/share/applications/" }
-- }}}

--{{---| Wibox |------------------------------------------------------------------------------------
-- Create a wibox for each screen and add it
mywibox             = {}
mypromptbox         = {}
mylayoutbox         = {}
mytaglist           = {}
mytaglist.buttons   = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist          = {}
mytasklist.buttons  = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
                                                      theme = { width = 250 }
                                                  })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s]  = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s]  = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1)  end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1)  end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s]    = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s]   = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s]      = awful.wibox({ position = "top", screen = s, height = "16"  })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])


    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(spacer)
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(spacer)
    right_layout:add(kbdcfg.widget)
    right_layout:add(spacer)
    right_layout:add(baticon)
    right_layout:add(batpct)
    right_layout:add(spacer)
    right_layout:add(volicon)
    right_layout:add(volpct)
    right_layout:add(volspace)
    right_layout:add(spacer)
    --right_layout:add(lan_usage)
    --right_layout:add(spacer)
    --right_layout:add(wifi_usage)
    right_layout:add(setIcon)
    right_layout:add(spacer)
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

--{{---| Mouse bindings |---------------------------------------------------------------------------
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle()                                        end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
--{{---| Key bindings |-----------------------------------------------------------------------------
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",    awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",   awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape",  awful.tag.history.restore),
    awful.key({ modkey,           }, "j",       function () 
                                                  awful.client.focus.byidx( 1)
                                                  if client.focus then 
                                                    client.focus:raise() 
                                                  end                                           end),
    awful.key({ modkey,           }, "k",       function () 
                                                  awful.client.focus.byidx(-1)
                                                  if client.focus then 
                                                    client.focus:raise()
                                                  end                                           end),
    awful.key({ modkey,           }, "w",       function () mymainmenu:show()                   end),
    awful.key({ modkey, "Shift"   }, "j",       function () awful.client.swap.byidx(  1)        end),
    awful.key({ modkey, "Shift"   }, "k",       function () awful.client.swap.byidx( -1)        end),
    awful.key({ modkey, "Control" }, "j",       function () awful.screen.focus_relative( 1)     end),
    awful.key({ modkey, "Control" }, "k",       function () awful.screen.focus_relative(-1)     end),
    awful.key({ modkey,           }, "u",       awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",     function () 
                                                  awful.client.focus.history.previous()
                                                  if client.focus then 
                                                    client.focus:raise() 
                                                  end 
                                                end),

--{{---| Hotkeys |----------------------------------------------------------------------------------

--{{---| Terminal |----------------------------------------------------------------------------------
    awful.key({ modkey,           }, "Return",  function () awful.util.spawn(terminal)          end),
    awful.key({ modkey, "Control" }, "Return",  function () awful.util.spawn(stmux)             end), 

--{{---| File managers |----------------------------------------------------------------------------------
    awful.key({ modkey,           }, "e",       function () 
                                                  if fme_started then
                                                    awful.util.spawn("pkill -f '" .. fme .. "'")
                                                  else
                                                    awful.util.spawn(fme)
                                                  end
                                                  fme_started = not fme_started
                                                end),
    awful.key({ modkey,           }, "s",       function () 
                                                  if fms_started then
                                                    awful.util.spawn("pkill -f '" .. fms .. "'")
                                                  else
                                                    awful.util.spawn(fms)
                                                  end
                                                  fms_started = not fms_started
                                                end),
    awful.key({ modkey,           }, "x",       function () 
                                                  if fmx_started then
                                                    awful.util.spawn("pkill -f '" .. fmx .. "'")
                                                  else
                                                    awful.util.spawn(fmx)
                                                  end
                                                  fmx_started = not fmx_started
                                                end),

--{{---| Standard |----------------------------------------------------------------------------------
    awful.key({ modkey, "Control" }, "r",       awesome.restart),
    awful.key({ modkey, "Shift"   }, "q",       awesome.quit),
    awful.key({ modkey,           }, "l",       function () awful.tag.incmwfact( 0.05)            end),
    awful.key({ modkey,           }, "h",       function () awful.tag.incmwfact(-0.05)            end),
    awful.key({ modkey, "Shift"   }, "h",       function () awful.tag.incnmaster( 1)              end),
    awful.key({ modkey, "Shift"   }, "l",       function () awful.tag.incnmaster(-1)              end),
    awful.key({ modkey, "Control" }, "h",       function () awful.tag.incncol( 1)                 end),
    awful.key({ modkey, "Control" }, "l",       function () awful.tag.incncol(-1)                 end),
    awful.key({ modkey,           }, "space",   function () awful.layout.inc(layouts,  1)         end),
    awful.key({ modkey, "Shift"   }, "space",   function () awful.layout.inc(layouts, -1)         end),
    awful.key({ modkey, "Control" }, "n",       awful.client.restore),

--{{---| Prompt |----------------------------------------------------------------------------------# lpinfo -m
    awful.key({ modkey },            "r",       function () mypromptbox[mouse.screen]:run()       end),
    awful.key({ modkey },            "Menu",    function () awful.util.spawn_with_shell("gmrun")  end),

    awful.key({ modkey, "Shift"   }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),

--{{---| Menubar |----------------------------------------------------------------------------------
    awful.key({ modkey }, "p",                  function() menubar.show()                         end),

--{{---| Screenshot |----------------------------------------------------------------------------------
    awful.key({ }, "Print",                     function () awful.util.spawn("scrot -e 'mv $f ~/Documents/screenshots/ 2>/dev/null'") end),

--{{---| Keyboard layout |----------------------------------------------------------------------------------
    awful.key({ "Mod1" }, "space",         function() kbdcfg.switch()                        end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",       function (c) c.fullscreen = not c.fullscreen      end),
    awful.key({ modkey, "Shift"   }, "c",       function (c) c:kill()                             end),
    awful.key({ modkey, "Control" }, "space",   awful.client.floating.toggle                         ),
    awful.key({ modkey, "Control" }, "Return",  function (c) c:swap(awful.client.getmaster())     end),
    awful.key({ modkey,           }, "o",       awful.client.movetoscreen                            ),
    awful.key({ modkey,           }, "t",       function (c) c.ontop = not c.ontop                end),
    awful.key({ modkey,           }, "n",       function (c) c.minimized = true                   end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical                                     end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

--{{---| Set keys |---------------------------------------------------------------------------------
root.keys(globalkeys)

--{{---| Rules |------------------------------------------------------------------------------------
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "Vlc" },
      properties = { floating = true } },
    { rule = { class = "Shutter" },
      properties = { floating = true } },
    { rule = { class = "Gimp" },
      properties = { tag = tags[1][8], floating = true } },
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][2] } },
    { rule = { class = "Gnome-commander" },
      properties = { tag = tags[1][3] } },
    --{ rule = { class = "Double" },
    --properties = { tag = tags[1][3] } },

    
    { rule = { class = "Thunderbird" },
    properties = { tag = tags[1][4] } },
    { rule = { class = "skype" },
      properties = { tag = tags[1][4] } },
    { rule = { class = "Pac" },
      properties = { tag = tags[1][5] } },
    { rule = { class = "Sublime" },
      properties = { tag = tags[1][1] } },
    { rule = { class = "libreoffice" },
      properties = { tag = tags[1][8]} },
    
}

--{{---| Signals |----------------------------------------------------------------------------------
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

--{{--| Autostart |---------------------------------------------------------------------------------
--require("autostart")


--{{Xx----------------------------------------------------------------------------------------------
