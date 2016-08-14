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
                     class          = { "Arandr", "Gpick", "Kruler", "MessageWin", 
                                        "Sxiv", "Wpa_gui", "pinentry","veromix","xtightvncviewer"},
                     name           = { "Event Tester", },
                     role           = { "AlarmWindow", "pop-up", }}, 
                     properties     = { floating = true                                         }},
    { rule = { class = "Vlc"              },  properties = { floating = true                    }},
    { rule = { class = "Shutter"          },  properties = { floating = true                    }},
    { rule = { class = "Sublime"          },  properties = { screen = 1, tag = "IDE"            }},
    { rule = { class = "Firefox"          },  properties = { screen = 1, tag = "Web"            }},
    --{ rule = { class = "Gnome-commander"  },  properties = { screen = 1, tag = "Files"          }},
    --{ rule = { class = "Doublecmd"        },  properties = { screen = 1, tag = "Files"          }},
    { rule = { class = "Thunderbird"      },  properties = { screen = 1, tag = "MSG"            }},
    { rule = { class = "skype"            },  properties = { screen = 1, tag = "MSG"            }},
    { rule = { class = "Org.gnome.Polari" },  properties = { screen = 1, tag = "MSG"            }},
    { rule = { class = "Empathy" },  properties = { screen = 1, tag = "MSG"                     }},
    --{ rule = { class = "Pac"              },  properties = { screen = 1, tag = "PAC"            }},
    { rule = { class = "libreoffice"      },  properties = { screen = 1, tag = "Work"           }},
    { rule = { class = "Gimp"             },  properties = { floating = true                    }},
    { rule = { class = "TeamViewer"       },  properties = { floating = true                    }},
}