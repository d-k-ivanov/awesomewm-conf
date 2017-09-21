## Only for AwesomeVM v4+

## Awesome WM config
>Thanks to **[Wei "pw" Peng](https://github.com/pw4ever)** who enspired me a lot! Look at his [awesome-wm-config](https://github.com/pw4ever/awesome-wm-config).

### Available widgets
All of mine [widgets](widgets/README.md) you could find in **[./widgets](/widgets)** directory. Each of them have own README file which describes functionality.
  - [backlight](widgets/backlight/README.md) - widget to control and show brightness level (laptop only)
  - [dropbox](widgets/dropbox/README.md) - simple Dropbox icon to replace original (which QT-based, so it bring some problems)
  - [keylock-icons](widgets/keylock-icons/README.md) - set of icons to show status of _Lock_ buttons

### Dependencies
Additional software should be installed to cover all shortcuts:
>Any of those packages are optional!

* Xserver with extras like setxkbmap, xdg, scrot, arands
* lxtask and gnome control center
* alsa + mixer + pulseaudio control
* xTerm and Terminator
* SpaceFM and PCmanFM
* Gnome Commander and Double Commander
* Dropbox

### Installation
```bash
git clone https://github.com/keepbot/awesomeWM-config.git ~/.config/awesome
Modkey+Control+r to restart awesome
```

### Keycodes
I've created aliases for keyboard buttons, which placed in keycodes.lua. 
If you want that "Modkey+F1" shows correct keyboard shortcuts you need to make a following change: 
```bash
vim /usr/share/awesome/lib/awful/hotkeys_popup/widget.lua
```
Find string: 
```
labels = args.labels or {
```
And replace built-in codes with my, placed in *keykodes.lua*

### Autostart

You need to create file *autostart.lua* and add simple startup records like this:
```lua
local autostart = require("runonce")

--{{---| Java GUI's fix ---}}---
autostart.run("wmname LG3D")

autostart.run("skypeforlinux")
--autostart.run("dropbox")
autostart.run("nm-applet")
autostart.run("jetbrains-toolbox --minimize")
--autostart.run("/home/id/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize")
--autostart.run"empathy")
autostart.run("pidgin")
autostart.run("slack")
autostart.run("telegram-desktop")
autostart.run("thunderbird")
-- autostart.run("firefox")
-- autostart.run("google-chrome-stable")
--autostart.run("gnome-commander")
--autostart.run("teamviewer12")
--autostart.run("pac")
--autostart.run("subl")
--autostart.run("sublime_text")
autostart.run("shutter --min_at_startup")
autostart.run("remmina -i")
autostart.run("goldendict")
--autostart.run("clipit")
autostart.run("xscreensaver -no-splash")
--autostart.run("yakyak")
```

### Rules

In **rules.lua** some rules are defined. You need to redefine them for your needs or remove.

**Rules**
```lua
-- xprop - X tool to get window properties
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule. Drop off maximized mode. Hack for release maximised windows.
  { rule = {}, callback = function(c) c.maximized, c.maximized_vertical, c.maximized_horizontal = false, false, false end},
  -- All clients in this rule will get floatig propertie
  { rule = { },
    properties = { border_width   = beautiful.border_width,
                   border_color   = beautiful.border_normal,
                   focus          = awful.client.focus.filter,
                   raise          = true,
                   keys           = clientkeys,
                   buttons        = clientbuttons,
                   placement      = awful.placement.no_overlap+awful.placement.no_offscreen   }},
  { rule_any   = { instance       =   { "DTA", "copyq", },
                   class          =   { "Arandr", "Gpick", "Kruler", "MessageWin", "TeamViewer","Sxiv", "Wpa_gui", "pinentry",
                                        "veromix", "xtightvncviewer", "Xscreensaver-demo", "Lxtask", "Speedcrunch", "Gnome-calculator",
                                        "Gnome-alsamixer", "Gimp", "Spacefm", "Pcmanfm", "Gmrun", "Usbview", "Wine", "Gtklp", "VirtualBox",
                                        "XCalc", "Vncviewer", "Pavucontrol", "Cheese", "HP Device Manager - Setup"},
                                        --"Leafpad",w
                   name           =   { "Event Tester" },
                   role           =   { "AlarmWindow", "pop-up", }},
                   properties     =   { floating = true                                         }},
  { rule = { class = "vlc"                },  properties = { floating = true                    }},
  { rule = { class = "Shutter"            },  properties = { floating = true                    }},
  { rule = { class = "Sublime"            },  properties = { tag = "IDE"                        }},
  { rule = { class = "subl3"              },  properties = { tag = "IDE"                        }},
  --{ rule = { class = "Firefox"          },  properties = { screen = 1, tag = "Web"            }},
  --{ rule = { class = "chromium"         },  properties = { screen = 1, tag = "Web"            }},
  { rule = { class = "Firefox"            },  properties = { tag = "Web"                        }},
  { rule = { class = "chromium"           },  properties = { tag = "Web"                        }},
  { rule = { class = "Google-chrome"      },  properties = { tag = "Web"                        }},
  --{ rule = { class = "Gnome-commander"  },  properties = { screen = 1, tag = "Files"          }},
  --{ rule = { class = "Doublecmd"        },  properties = { screen = 1, tag = "Files"          }},
  { rule = { class = "Thunderbird"        },  properties = { tag = "MSG"                        }},
  { rule = { class = "Geary"              },  properties = { tag = "MSG"                        }},
  { rule = { class = "skype"              },  properties = { tag = "MSG"                        }},
  { rule = { class = "Org.gnome.Polari"   },  properties = { tag = "MSG"                        }},
  { rule = { class = "Empathy"            },  properties = { tag = "MSG"                        }},
  { rule = { class = "Pidgin"             },  properties = { tag = "MSG"                        }},
  { rule = { class = "yakyak"             },  properties = { tag = "MSG"                        }},
  { rule = { class = "TelegramDesktop"    },  properties = { tag = "MSG"                        }},
  { rule = { class = "Slack"              },  properties = { tag = "MSG"                        }}
  --{ rule = { class = "Pac"              },  properties = { screen = 1, tag = "PAC"            }},
  --{ rule = { class = "libreoffice"        },  properties = { tag = "Work"                       }}
  --{ rule = { class = "SWT"                },  properties = { tag = "Work"                       }}
  --{ rule = { class = "Gimp"               },  properties = { floating = true                    }}
}
```

### Themes
I've desided to stay with only one theme which fits my need/

*Screenshot:*

![WhiteTheme](screenshot/white.png)


#### There are old themes also existed in directory _theme/old_
To change theme you need to change theme name and main colour in *theme.lua*


I created following themes:
* Blue   - 'blue'
* Gray   - 'gray'
* Green  - 'green'
* Purple - 'purple'
* Red    - 'red'
* Yellow - 'yellow'
* Zen    - 'zen'

*Screenshot of purple:*

![PurpleTheme](screenshot/purple.png)

### Keyboard

To configure keyboard layout you neet to make apropriate changes in *whdgets.lua* 
Defaut layout: *US* and *RU*
And key combination: Alt+Space (Which can be defined in *bindings.lua*, but this is the best I could think of)

