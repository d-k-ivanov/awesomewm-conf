local awful     = require("awful")
local beautiful = require("beautiful")
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
    { rule = { class = "Vlc"              },  properties = { floating = true                    }},
    { rule = { class = "Shutter"          },  properties = { floating = true                    }},
    { rule = { class = "Sublime"          },  properties = { tag = tags[1][1]                   }},
    { rule = { class = "Firefox"          },  properties = { tag = tags[1][2]                   }},
    --{ rule = { class = "Gnome-commander"  },  properties = { tag = tags[1][3]                   }},
    --{ rule = { class = "Doublecmd"        },  properties = { tag = tags[1][3]                   }},
    { rule = { class = "Thunderbird"      },  properties = { tag = tags[1][4]                   }},
    { rule = { class = "skype"            },  properties = { tag = tags[1][4]                   }},
    --{ rule = { class = "Pac"              },  properties = { tag = tags[1][5]                   }},
    { rule = { class = "libreoffice"      },  properties = { tag = tags[1][8]                   }},
    { rule = { class = "Gimp"             },  properties = { tag = tags[1][9], floating = true  }},
    
}