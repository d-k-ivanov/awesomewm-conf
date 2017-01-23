--{{---| Standard |--------------------------------------------------------------------------------------------------------
local awful         = require("awful")
local gears         = require("gears")
awful.rules         = require("awful.rules")
                      require("awful.autofocus")
local xresources    = require("beautiful.xresources")
local dpi           = xresources.apply_dpi

--{{---| Parse config |----------------------------------------------------------------------------------------------------
local config_path   = awful.util.getdir("config")
package.path        = config_path .. "/?.lua;"                  .. package.path
package.path        = config_path .. "/?/init.lua;"             .. package.path
package.path        = config_path .. "/extensions/?.lua;"       .. package.path
package.path        = config_path .. "/extensions/?/?.lua;"     .. package.path
package.path        = config_path .. "/extensions/?/init.lua;"  .. package.path

--{{---| Theme |------------------------------------------------------------------------------------------------------------
local beautiful     = require("beautiful")
beautiful.init(awful.util.getdir("config") .. "/theme/theme.lua")
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

--{{---| Menu |-------------------------------------------------------------------------------------------------------------
awful.menu          = require("awful.menu")
local appmenu       = require("appmenu")
local menubar       = require("menubar")

--{{---| Widgets |----------------------------------------------------------------------------------------------------------
local wibox         = require("wibox")
local widgets       = require("widgets")

--{{---| Notificaton and error handling |-----------------------------------------------------------------------------------
local naughty       = require("naughty")
local handler       = require("handler")
local hotkeys_popup = require("awful.hotkeys_popup").widget

--{{---| Helpers |----------------------------------------------------------------------------------------------------------
local helpers       = require("helpers")

--{{---| Bashets |----------------------------------------------------------------------------------------------------------
local bashets       = require("bashets")

--{{---| Lain |-------------------------------------------------------------------------------------------------------------
local lain          = require("lain")

--{{---| Keycodes |--_------------------------------------------------------------------------------------------------------
require("keycodes")

--{{---| Java GUI's fix |---------------------------------------------------------------------------------------------------
awful.util.spawn_with_shell("wmname LG3D")

--{{---| Variables |--------------------------------------------------------------------------------------------------------
terminal            = "xterm"
terminal2           = "terminator"
editor              = os.getenv("EDITOR") or "vim"
editor_cmd          = terminal .. " -e " .. editor
browser             = "firefox"
fme                 = "spacefm"
fms                 = "gnome-commander"
fmd                 = "doublecmd"
fmx                 = "pcmanfm"
stmux               = terminal .. " -e tmux -2"

--{{---| Session variables |------------------------------------------------------------------------------------------------
local fme_started   = false
local fms_started   = false
local fmd_started   = false
local fmx_started   = false


--{{---| Table of layouts |-------------------------------------------------------------------------------------------------
local layouts       =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.fair,
    awful.layout.suit.magnifier,
    awful.layout.suit.max,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max.fullscreen
    --lain.layout.cascade,
    --lain.layout.cascadetile,
    --lain.layout.centerfair,
    --lain.layout.centerhwork,
    --lain.layout.centerwork,
    --lain.layout.centerworkd,
    --lain.layout.termfair,
    --lain.layout.uselessfair,
    --lain.layout.uselesspiral,
    --lain.layout.uselesstile,
}

--{{---| Tags |-------------------------------------------------------------------------------------------------------------
tags                        = {
  names                     = { 
                                "IDE", "Web", "Files", "MSG",
                                "PAC", "SQL", "IMG", "Term", "Work" 
                              },
  layout                    = { 
                                layouts[6], layouts[2], layouts[1], layouts[2],
                                layouts[6], layouts[6], layouts[6], layouts[2], layouts[2]
                              }
}

--{{---| Menu |-------------------------------------------------------------------------------------------------------------
-- do not use letters, which shadow access key to menu entry
awful.menu.menu_keys.down   = { "Down", ".", ">", "'", "\"",                          }
awful.menu.menu_keys.up     = {  "Up", ",", "<", ";", ":",                            }
awful.menu.menu_keys.enter  = { "Right", "]", "}", "=", "+",                          }
awful.menu.menu_keys.back   = { "Left", "[", "{", "-", "_",                           }
awful.menu.menu_keys.exec   = { "Return", "Space",                                    }
awful.menu.menu_keys.close  = { "Escape", "BackSpace",                                }

-- Terminator
--myawesomemenu = {
--   { "manual",              terminal .. ' -e "source ~/.bashrc; man awesome"' },
--   { "edit config",         terminal .. ' -e "source ~/.bashrc;' .. editor .. " " .. awesome.conffile .. '"' },
--   { "reload",              awesome.restart },
--   { "reboot",              "sudo reboot" },
--   { "quit",                awesome.quit }
--}
-- xTerm
myawesomemenu = {
  { "Read manual",            terminal .. ' -e "man awesome"',                                  beautiful.manual_icon     },
  { "Edit Awesome config",    terminal .. ' -e "' .. editor .. " " .. awesome.conffile .. '"',  beautiful.edit_icon       },
  { "Reload",                 awesome.restart,             beautiful.reload_icon     }

}


mymainmenu = awful.menu({ items = { 
  { "Awesome",                myawesomemenu,               beautiful.awesone_default },
  { "Applications",           appmenu,                     beautiful.awesome_icon    },
  { "Open xTerm",             terminal,                    beautiful.terminal_icon   },
  { "Open Terminator",        terminal2,                   beautiful.terminator_icon },
  { "Quit",                   awesome.quit,                beautiful.quit_icon       },
  { "Hibernate",              "sudo pm-hibernate",         beautiful.hibernate_icon  },
  { "Reboot",                 "sudo reboot",               beautiful.restart_icon    },
  { "Shutdown",               "sudo shutdown -h 0",        beautiful.shutdown_icon   }
}
})

mylauncher                  = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal      = terminal  -- Set the terminal for applications that require it
app_folders                 = { "/usr/share/applications/", "~/.local/share/applications/" }
-- }}}

--{{---| Wibox |------------------------------------------------------------------------------------------------------------
-- Create a wibox for each screen and add it
mywibox                     = {}
mypromptbox                 = {}
mylayoutbox                 = {}
mytaglist                   = {}
mytaglist.buttons           = awful.util.table.join(
                              awful.button({ },         1, awful.tag.viewonly),
                              awful.button({ modkey },  1, awful.client.movetotag),
                              awful.button({ },         3, awful.tag.viewtoggle),
                              awful.button({ modkey },  3, awful.client.toggletag),
                              awful.button({ },         4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                              awful.button({ },         5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end))
mytasklist                  = {}
mytasklist.buttons          = awful.util.table.join(
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
                              awful.button({ }, 3, client_menu_toggle_fn()),
                              awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                              awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

awful.screen.connect_for_each_screen(function(s)

      -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end

     -- Each screen has its own tag table.
    awful.tag(tags.names, s, tags.layout)

    -- Create a promptbox for each screen
    mypromptbox[s]          = awful.widget.prompt()

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s]          = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(   awful.util.table.join(
                              awful.button({ }, 1, function () awful.layout.inc(layouts, 1  )       end),
                              awful.button({ }, 3, function () awful.layout.inc(layouts, -1 )       end),
                              awful.button({ }, 4, function () awful.layout.inc(layouts, 1  )       end),
                              awful.button({ }, 5, function () awful.layout.inc(layouts, -1 )       end))
    )
    -- Create a taglist widget
    mytaglist[s]            = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
    
    -- Create a tasklist widget
    mytasklist[s]           = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)
    
    -- Create the wibox
    mywibox[s]              = awful.wibox({ position = "top", screen = s, height = dpi(16)  })
    
    -- Add widgets to the wibox
    mywibox[s]:setup {
      layout = wibox.layout.align.horizontal,
      { -- Widgets that are aligned to the left
        layout                = wibox.layout.fixed.horizontal(),
        mylauncher,
        mytaglist[s],
        mypromptbox[s],
      },
        mytasklist[s], -- Middle widget
      {-- Widgets that are aligned to the right
        layout                = wibox.layout.fixed.horizontal(),

        systray,
        spacer0,
        kbdcfg.widget,
        spacer0,
        setIcon,
        spacer0,
        mylayoutbox[s],

        spacer,
        baticon,
        batpct,
        spacer,
        volicon,
        volpct,
    
        spacer,
        mytextclock,
        spacer0,
      },
    }  
end)
-- }}}

--{{---| Mouse bindings |---------------------------------------------------------------------------------------------------
root.buttons(awful.util.table.join(
    awful.button({ },                 3,        function () mymainmenu:toggle()                         end)
    --awful.button({ },                 4,        awful.tag.viewnext),
    --awful.button({ },                 5,        awful.tag.viewprev)
))
--{{---| Key bindings |-----------------------------------------------------------------------------------------------------
globalkeys = awful.util.table.join(
    awful.key({ modkey,           },  key_F1,     hotkeys_popup.show_help,
                                                  {description = "Show help",                             group = "Awesome"       }),
    awful.key({ modkey,           },  key_Left,   awful.tag.viewprev,
                                                  {description = "View previous Tag",                     group = "Tag"           }),
    awful.key({ modkey,           },  key_Right,  awful.tag.viewnext,
                                                  {description = "View next Tag",                         group = "Tag"           }),
    awful.key({ modkey,           },  key_Escape, awful.tag.history.restore,
                                                  {description = "Go back",                               group = "Tag"           }),
    awful.key({ modkey,           },  key_j,      function () awful.client.focus.byidx( 1)                end,
                                                  {description = "Focus next",                            group = "Client"        }),
    awful.key({ modkey,           },  key_k,      function () awful.client.focus.byidx(-1)                end,
                                                  {description = "Focus previous",                        group = "Client"        }),
    awful.key({ modkey,           },  key_w,      function () mymainmenu:show()                           end,
                                                  {description = "Show main menu",                        group = "Awesome"       }),
    awful.key({ modkey, "Shift"   },  key_j,      function () awful.client.swap.byidx(  1)                end,
                                                  {description = "Swap with next client",                 group = "Client"        }),
    awful.key({ modkey, "Shift"   },  key_k,      function () awful.client.swap.byidx( -1)                end,
                                                  {description = "Swap with previous client",             group = "Client"        }),
    awful.key({ modkey, "Control" },  key_j,      function () awful.screen.focus_relative( 1)             end,
                                                  {description = "Focus the next screen",                 group = "Screen"        }),
    awful.key({ modkey, "Control" },  key_k,      function () awful.screen.focus_relative(-1)             end,
                                                  {description = "Focus the previous screen",             group = "Screen"        }),
    awful.key({ modkey,           },  key_u,      awful.client.urgent.jumpto,
                                                  {description = "Jump to urgent client",                 group = "Client"        }),
    awful.key({ modkey,           },  key_Tab,    awful.tag.viewnext,
                                                  {description = "View next Tag",                         group = "Client"        }),
    awful.key({ altkey,           },  key_Tab,    awful.tag.viewprev,
                                                  {description = "View previous Tag",                     group = "Client"        }),
    -- awful.key({ modkey,           },  key_Tab", function () awful.client.focus.history.previous()
    --                                               if client.focus then 
    --                                                 client.focus:raise() end                            end,
    --                                             {description = "Go back",                               group = "Client"}),  

--{{---| Hotkeys |----------------------------------------------------------------------------------------------------------

--{{---| Terminal |---------------------------------------------------------------------------------------------------------
    awful.key({ modkey,           },  key_Return, function () awful.util.spawn(terminal)                  end,
                                                  {description = "Run xTerm",                             group = "Terminals"     }), 
    awful.key({ modkey, "Control" },  key_Return, function () awful.util.spawn(terminal2)                 end,
                                                  {description = "Run Terminator",                        group = "Terminals"     }),  

--{{---| File managers |----------------------------------------------------------------------------------------------------
    awful.key({ modkey,           },  key_e,      function () 
                                                    if fme_started then
                                                      awful.util.spawn("pkill -f '" .. fme .. "'")
                                                    else
                                                      awful.util.spawn(fme)
                                                    end
                                                    fme_started = not fme_started                         end,
                                                  {description = "Tougle SpaceFM",                        group = "File managers" }),
    awful.key({ modkey,           },  key_s,      function () awful.util.spawn(fms)                       end,
                                                  {description = "Run Gnome-Commander",                   group = "File managers" }),
    awful.key({ modkey, "Shift"   },  key_s,      function () awful.util.spawn(fmd)                       end,
                                                  {description = "Run Duble-Commander",                   group = "File managers" }),
    awful.key({ modkey,           },  key_x,      function () 
                                                    if fmx_started then
                                                      awful.util.spawn("pkill -f '" .. fmx .. "'")
                                                    else
                                                      awful.util.spawn(fmx)
                                                    end
                                                    fmx_started = not fmx_started                         end,
                                                  {description = "Tougle PCmanFM",                        group = "File managers" }),

--{{---| Standard |---------------------------------------------------------------------------------------------------------
    awful.key({ modkey, "Control" },  key_r,      awesome.restart,
                                                  { description= "Reload configuration",                  group = "Awesome"       }), 
    awful.key({ modkey, "Shift"   },  key_q,      awesome.quit,
                                                  { description= "Exit from Awesome",                     group = "Awesome"       }),
    awful.key({ modkey,           },  key_l,      function () awful.tag.incmwfact( 0.05)                  end,
                                                  {description = "Increase master width",                 group = "Layout"        }),
    awful.key({ modkey,           },  key_h,      function () awful.tag.incmwfact(-0.05)                  end,
                                                  {description = "Decrease master width",                 group = "Layout"        }),
    awful.key({ modkey, "Shift"   },  key_h,      function () awful.tag.incnmaster( 1)                    end, 
                                                  {description = "Increase the number of master clients", group = "Layout"        }),
    awful.key({ modkey, "Shift"   },  key_l,      function () awful.tag.incnmaster(-1)                    end,
                                                  {description = "Decrease the number of master clients", group = "Layout"        }),
    awful.key({ modkey, "Control" },  key_h,      function () awful.tag.incncol( 1)                       end,
                                                  {description = "Increase the number of columns",        group = "Layout"        }),
    awful.key({ modkey, "Control" },  key_l,      function () awful.tag.incncol(-1)                       end,
                                                  {description = "Decrease the number of columns",        group = "Layout"        }),
    awful.key({ modkey,           },  key_Space,  function () awful.layout.inc(layouts,  1)               end,
                                                  {description = "Select next",                           group = "Layout"        }),
    awful.key({ modkey, "Shift"   },  key_Space,  function () awful.layout.inc(layouts, -1)               end,
                                                  {description = "Select previous",                       group = "Layout"        }),
    awful.key({ modkey, "Control" },  key_n,      awful.client.restore,
                                                  {description = "Restore minimized",                     group = "Client"        }),

--{{---| Prompt |-----------------------------------------------------------------------------------------------------------
    awful.key({ modkey,           },  key_r,      function () mypromptbox[awful.screen.focused()]:run()   end,
                                                  {description = "Run prompt",                            group = "Launcher"      }),
    awful.key({ modkey, "Shift"   },  key_r,      function () awful.util.spawn_with_shell("gmrun")        end,
                                                  {description = "Run GTK prompt",                        group = "Launcher"      }),

    awful.key({ modkey, "Shift"   },  key_x,      function ()
                                                  awful.prompt.run({ prompt = "Run Lua code: " },
                                                  mypromptbox[mouse.screen].widget,
                                                  awful.util.eval, nil,
                                                  awful.util.getdir("cache") .. "/history_eval")          end,
                                                  {description = "LUA execute prompt",                    group = "Launcher"      }),

--{{---| Menubar |----------------------------------------------------------------------------------------------------------
    awful.key({ modkey,            },  key_p,     function() menubar.show()                               end,
                                                  {description = "Show menu bar",                         group = "Launcher"      }), 

--{{---| Screenshot |-------------------------------------------------------------------------------------------------------
    awful.key({                    },  key_Print, function () awful.util.spawn("scrot -e 'mv $f ~/Documents/screenshots/ 2>/dev/null'") end,
                                                  {description = "Take Screenshot",                       group = "Utilities"     }),

--{{---| Lock Screen |------------------------------------------------------------------------------------------------------
    awful.key({ modkey,            }, key_z,      function () awful.util.spawn("xscreensaver-command -lock") end,
                                                  {description = "Lock screen",                           group = "Utilities"     }),

--{{---| arandr |-----------------------------------------------------------------------------------------------------------
    awful.key({ modkey,            }, key_Tilda,  function () awful.util.spawn("arandr")                  end,
                                                  {description = "run arandr",                            group = "Software"     }),

--{{---| Virt-Manager |-----------------------------------------------------------------------------------------------------
    awful.key({ modkey,            }, key_v,      function () awful.util.spawn("sudo virt-manager")       end,
                                                  {description = "run sudo virt-manager",                 group = "Software"     }),

--{{---| Network Restart |-----------------------------------------------------------------------------------------------------
    awful.key({ modkey, "Shift"    }, key_n,      function () awful.util.spawn("sudo systemctl restart NetworkManager.service")         end,
                                                  {description = "Restart Network Manager",                 group = "Software"     }),


--{{---| Keyboard layout |--------------------------------------------------------------------------------------------------
    awful.key({ altkey,            },  key_Space, function() kbdcfg.switch()                              end,
                                                  {description = "Change keyboard layout",                group = "Utilities"     })
    --awful.key({ "Shift",           },  key_Ctrl_L,function() kbdcfg.switch()                              end,
    --                                              {description = "Change keyboard layout",                group = "Utilities"     })
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, key_f,       function (c) c.fullscreen = not c.fullscreen            end,
                                                  {description = "Toggle fullscreen",                     group = "Client"        }),
    awful.key({ modkey, "Shift"   }, key_c,       function (c) c:kill()                                   end,
                                                  {description = "Close",                                 group = "Client"        }),
    awful.key({ modkey,           }, key_d,       function (c) c:kill()                                   end,
                                                  {description = "Close",                                 group = "Client"        }),
    awful.key({ modkey, "Control" }, key_Space,   awful.client.floating.toggle,
                                                  {description = "Toggle floating",                       group = "Client"        }),
    awful.key({ modkey, "Control" }, key_Return,  function (c) c:swap(awful.client.getmaster())           end,
                                                  {description = "Move to master",                        group = "Client"        }),
    awful.key({ modkey,           }, key_q,       awful.client.movetoscreen,
                                                  {description = "Move to screen",                        group = "Client"        }),
    awful.key({ modkey,           }, key_o,       awful.client.movetoscreen,
                                                  {description = "Move to screen",                        group = "Client"        }),
    awful.key({ modkey,           }, key_t,       function (c) c.ontop      = not c.ontop                 end,
                                                  {description = "Toggle keep on top",                    group = "Client"        }),
    awful.key({ modkey,           }, key_n,       function (c) c.minimized  = true                        end,
                                                  {description = "Minimize",                              group = "Client"        }),
    awful.key({ modkey,           }, key_m,       function (c) c.maximized_horizontal  = not c.maximized_horizontal
                                                  c.maximized_vertical    = not c.maximized_vertical      end,
                                                  {description = "Maximize",                              group = "Client"        })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = awful.util.table.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,         function () local screen = awful.screen.focused()
                                                local tag = screen.tags[i]
                                                if tag then
                                                  tag:view_only()
                                                end                                                     end,
                                                {description = "View tag #"..i,                         group = "Tag" }),
    -- Toggle tag.
    awful.key({ modkey, "Control" }, "#" .. i + 9,
                                                function () local screen = awful.screen.focused()
                                                local tag = screen.tags[i]
                                                if tag then
                                                  awful.tag.viewtoggle(tag)
                                                end                                                     end,
                                                {description = "Toggle tag #" .. i,                     group = "Tag" }),
    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
                                                function () if client.focus then
                                                local tag = client.focus.screen.tags[i]
                                                if tag then
                                                  client.focus:move_to_tag(tag)
                                                end end                                                 end,
                                                {description = "Move focused client to tag #"..i,       group = "Tag" }),
    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                                                function () if client.focus then
                                                local tag = client.focus.screen.tags[i]
                                                if tag then
                                                  client.focus:toggle_tag(tag)
                                                end end                                                 end,
                                                {description = "Toggle focused client on tag #" .. i,   group = "Tag" })
    )
end

clientbuttons = awful.util.table.join(
    awful.button({ },         1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey },  1, awful.mouse.client.move),
    awful.button({ modkey },  3, awful.mouse.client.resize))

--{{---| Set keys |---------------------------------------------------------------------------------------------------------
root.keys(globalkeys)

--{{---| Rules |------------------------------------------------------------------------------------------------------------
-- Rules to apply to new clients (through the "manage" signal).
require("rules")

--{{---| Signals |----------------------------------------------------------------------------------------------------------
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
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

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus
-- client.connect_signal("mouse::enter", function(c)
--     if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
--         and awful.client.focus.filter(c) then
--         client.focus = c
--     end
-- end)

client.connect_signal("manage", function (c)
  -- Enable sloppy focus
  local sloppy_focus_last_coords = mouse.coords()
  c:connect_signal("mouse::enter", function(c)
    -- bnote("mouse::enter::focus", 2)
    local coords = mouse.coords()
    local last = sloppy_focus_last_coords
    -- bnote("coords: " .. coords.x .. "/" .. coords.y )
    -- bnote("last  : " .. last.x .. "/" .. last.y )
    if coords.x == last.x and coords.y == last.y then
      return
    end
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier and awful.client.focus.filter(c) then
        client.focus = c
    end
    sloppy_focus_last_coords = {x=coords.x, y=coords.y}
  end)
end)

client.connect_signal("focus",    function(c) c.border_color = beautiful.border_focus             end)
client.connect_signal("unfocus",  function(c) c.border_color = beautiful.border_normal            end)

--{{--| Autostart |---------------------------------------------------------------------------------------------------------

-- function run_once(prg,arg_string,pname,screen)
--   if not prg then
--     do return nil end
--   end

--   if not pname then
--     pname = prg
--   end

--   if not arg_string then 
--     awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. ")",screen)
--   else
--     awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. " ".. arg_string .."' || (" .. prg .. " " .. arg_string .. ")",screen)
--   end
-- end

function run_once(cmd)
  findme      = cmd
  firstspace  = cmd:find(" ")
  if firstspace then
    findme    = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

require("autostart")


--{{Xx----------------------------------------------------------------------------------------------------------------------
