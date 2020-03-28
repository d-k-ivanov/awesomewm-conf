-- do not use letters, which shadow access key to menu entry
awful.menu.menu_keys.down  = { "Down", ".", ">", "'", "\"", }
awful.menu.menu_keys.up    = {  "Up", ",", "<", ";", ":",   }
awful.menu.menu_keys.enter = { "Right", "]", "}", "=", "+", }
awful.menu.menu_keys.back  = { "Left", "[", "{", "-", "_",  }
awful.menu.menu_keys.exec  = { "Return", "Space",           }
awful.menu.menu_keys.close = { "Escape", "BackSpace",       }

-- Terminator
--myawesomemenu = {
--   { "manual",      terminal .. ' -e "source ~/.bashrc; man awesome"' },
--   { "edit config", terminal .. ' -e "source ~/.bashrc;' .. editor .. " " .. awesome.conffile .. '"' },
--   { "reload",      awesome.restart },
--   { "reboot",      "sudo reboot" },
--   { "quit",        awesome.quit }
--}

-- xTerm
myawesomemenu = {
  { "Read manual", terminal .. ' -e "man awesome"', beautiful.manual_icon },
  { "Edit Awesome config", terminal .. ' -e "' .. editor .. " " .. awesome.conffile .. '"', beautiful.edit_icon },
  { "Reload", awesome.restart, beautiful.reload_icon }

}

-- mymainmenu = awful.menu({ items = {
--   { "Awesome",         myawesomemenu,        beautiful.awesone_default },
--   { "Applications",    myappmenu,            beautiful.awesome_icon    },
--   { "Open xTerm",      terminal,             beautiful.terminal_icon   },
--   { "Open Terminator", terminal2,            beautiful.terminator_icon },
--   { "Quit",            awesome.quit,         beautiful.quit_icon       },
--   { "Hibernate",       "sudo pm-hibernate",  beautiful.hibernate_icon  },
--   { "Reboot",          "sudo reboot",        beautiful.restart_icon    },
--   { "Shutdown",        "sudo shutdown -h 0", beautiful.shutdown_icon   }
-- }
-- })

mymainmenu = freedesktop.menu.build({
    before = {
        { "Awesome",        myawesomemenu,        beautiful.awesone_default },
    },
    after = {
        { "Open Alacritty", terminal,             beautiful.terminal_icon   },
        { "Open xTerm",     terminal2,            beautiful.terminator_icon },
        { "Quit",           awesome.quit,         beautiful.quit_icon       },
        { "Hibernate",      "sudo pm-hibernate",  beautiful.hibernate_icon  },
        { "Reboot",         "sudo reboot",        beautiful.restart_icon    },
        { "Shutdown",       "sudo shutdown -h 0", beautiful.shutdown_icon   }
    }
})

-- mylauncher   = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
mylauncher      = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal  = terminal  -- Set the terminal for applications that require it
app_folders             = { "/usr/share/applications/", "~/.local/share/applications/" }
-- }}}
