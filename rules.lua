-- xprop - X tool to get window properties
local awful     = require("awful")
local beautiful = require("beautiful")
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width   = beautiful.border_width,
                     border_color   = beautiful.border_normal,
                     focus          = awful.client.focus.filter,
                     raise          = true,
                     keys           = clientkeys,
                     buttons        = clientbuttons,
                     placement      = awful.placement.no_overlap+awful.placement.no_offscreen   }},
    { rule_any   = { instance       = { "DTA", "copyq", },
                     class          = { "Arandr", "Gpick", "Kruler", "MessageWin", "TeamViewer","Sxiv", "Wpa_gui", "pinentry", 
                                        "veromix", "xtightvncviewer", "Xscreensaver-demo", "Lxtask", "Speedcrunch", "Gnome-calculator",
                                        "Gnome-alsamixer", "Gimp", "Spacefm", "Gnome-commander", "Doublecmd", "Pcmanfm", "Gmrun"},
                     name           = { "Event Tester" },
                     role           = { "AlarmWindow", "pop-up", }}, 
                     properties     = { floating = true                                         }},
    { rule = { class = "Vlc"              },  properties = { floating = true                    }},
    { rule = { class = "Shutter"          },  properties = { floating = true                    }},
    { rule = { class = "Sublime"          },  properties = { tag = "IDE"                        }},
    { rule = { class = "subl3"            },  properties = { tag = "IDE"                        }},
    --{ rule = { class = "Firefox"          },  properties = { screen = 1, tag = "Web"            }},
    --{ rule = { class = "chromium"         },  properties = { screen = 1, tag = "Web"            }},
    { rule = { class = "Firefox"          },  properties = { tag = "Web"                        }},
    { rule = { class = "chromium"         },  properties = { tag = "Web"                        }},
    --{ rule = { class = "Gnome-commander"  },  properties = { screen = 1, tag = "Files"          }},
    --{ rule = { class = "Doublecmd"        },  properties = { screen = 1, tag = "Files"          }},
    { rule = { class = "Thunderbird"      },  properties = { tag = "MSG"                        }},
    { rule = { class = "skype"            },  properties = { tag = "MSG"                        }},
    { rule = { class = "Org.gnome.Polari" },  properties = { tag = "MSG"                        }},
    { rule = { class = "Empathy"          },  properties = { tag = "MSG"                        }},
    --{ rule = { class = "Pac"              },  properties = { screen = 1, tag = "PAC"            }},
    { rule = { class = "libreoffice"      },  properties = { tag = "Work"                       }}
    --{ rule = { class = "Gimp"             },  properties = { floating = true                    }},
}