--{{---| Tray |-------------------------------------------------------------------------------------------------------------
systray = wibox.widget.systray()

layouts = {
            awful.layout.suit.fair,             -- 1
            awful.layout.suit.tile,             -- 2
            awful.layout.suit.floating,         -- 3
            awful.layout.suit.tile.bottom,      -- 4
            awful.layout.suit.max,              -- 5
            awful.layout.suit.magnifier,        -- 6
            -- awful.layout.suit.tile.left,
            -- awful.layout.suit.tile.top,
            -- awful.layout.suit.fair.horizontal,
            -- awful.layout.suit.spiral,
            -- awful.layout.suit.spiral.dwindle,
            -- awful.layout.suit.max.fullscreen
            -- lain.layout.cascade,
            -- lain.layout.cascadetile,
            -- lain.layout.centerfair,
            -- lain.layout.centerhwork,
            -- lain.layout.centerwork,
            -- lain.layout.centerworkd,
            -- lain.layout.termfair,
            -- lain.layout.uselessfair,
            -- lain.layout.uselesspiral,
            -- lain.layout.uselesstile,
          }

--{{---| Tags |-------------------------------------------------------------------------------------------------------------
tags    = {
-- names = { "Main", "Web", "Files", "MSG", "Deploy", "Term", "Remote", "Dev", "Win", "DB", "Android", "Games"},
  names = { "main",     -- 1 -- "Main"
            "web",      -- 2 -- "Web"
            "msg",      -- 3 -- "Messages"
            "files",    -- 4 -- "Files"
            "work",     -- 5 -- "Work"
            "dev",      -- 6 -- "Dev"
            "data",     -- 7 -- "DataBase"
            "term",     -- 8 -- "Term"
            "win",      -- 9 -- "Windows"
        },
  layout = {
            layouts[1], -- 1 -- "Main"
            layouts[1], -- 2 -- "Web"
            layouts[1], -- 3 -- "Messages
            layouts[1], -- 4 -- "Files"
            layouts[1], -- 5 -- "Work"
            layouts[1], -- 6 -- "Dev"
            layouts[1], -- 7 -- "DataBase
            layouts[1], -- 8 -- "Term"
            layouts[3]  -- 9 -- "Windows"
        }
}

mywibox                         = {}
mypromptbox                     = {}
mylayoutbox                     = {}
mytaglist                       = {}
mytaglist.buttons               = awful.util.table.join(
    awful.button({ },           1, function(t) t:view_only()                                        end),
    awful.button({ modkey },    1, function(t) if client.focus then client.focus:move_to_tag(t) end end),
    awful.button({ },           3, awful.tag.viewtoggle),
    awful.button({ modkey },    3, function(t) if client.focus then client.focus:toggle_tag(t)  end end),
    awful.button({ },           4, function(t) awful.tag.viewnext(awful.tag.getscreen(t))           end),
    awful.button({ },           5, function(t) awful.tag.viewprev(awful.tag.getscreen(t))           end))
mytasklist                      = {}
mytasklist.buttons              = awful.util.table.join(
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
    end)
)


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
    -- if ( s == screen.primary) then
    --     awful.tag(tags.names, s, tags.layout)
    -- else
    --     awful.tag({""}, s, tags.layout)
    -- end

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
    mywibox[s]              = awful.wibar({ position = "top", screen = s, height = dpi(24) })
    -- if ( s == screen.primary) then
    --     mywibox[s]              = awful.wibar({ position = "top", screen = s, height = dpi(16) })
    -- else
    --     mywibox[s]              = awful.wibar({ position = "top", screen = s, height = dpi(10) })
    -- end

    -- Add widgets to the wibox
    if ( s == screen.primary) then
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
                --spacer,
                systray,
                spacer0,
                kbdcfg.widget,
                spacer0,
                setIcon,
                spacer,
                dropbox_widget,
                spacer,
                baticon,
                batpct,
                spacer,
                brightness_widget,
                spacer,
                volicon,
                volpct,
                spacer,
                keylock_icons_widget,
                spacer,
                mytextclock,
                spacer0,
                mylayoutbox[s],
            },
        }
    else
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
                spacer0,
                mylayoutbox[s],
            },
        }
    end

end)
-- }}}
