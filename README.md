# Only for AwesomeVM v4+

# Awesome config

Thanks to **[Wei "pw" Peng](https://github.com/pw4ever)** who enspired me a lot! Look at his [awesome-wm-config](https://github.com/pw4ever/awesome-wm-config).
Maybe in future I'll make all-in-one-ultimate-awesome-config. You can use GutHub issues for feature requests and any other offers. 

### Installation
I'd recommend use ArchLinux with this config, because of arch menu generation, but it isn't necessary.
Any dependencies you can find in rc.lua and change for something yours.

```bash
# Dependencies:
sudo pacman -S sacura terminator vim firefox spacefm gnome-commander doublecmd \
               pcmanfm tmux gnome-control-center gnome-alsamixer alsa-utils    \
               pm-utils gmrun scrot xorg-setxkbmap lxtask

git clone https://github.com/keepbot/awesome-config.git ~/.config/awesome

touch ~/.config/awesome/autostart.lua

# For arch users
~/.config/awesome/archmenu.gen
# For others
touch ~/.config/awesome/archmenu.lua

Modkey4+Control+r to restart awesome
```

### Autostart

You need to create file *autostart.lua* and add simple startup records like this:
```lua
-- run_once(prg,arg_string,pname,screen)
run_once("skype")
run_once("dropbox")
run_once("nm-applet")
run_once("empathy")
run_once("thunderbird")
run_once("firefox")
--run_once("gnome-commander")
run_once("teamviewer")
--run_once("pac")
run_once("sublime_text")
run_once("shutter --min_at_startup")
run_once("remmina -i")
```

### Rules

In **rules.lua** some rules are defined. You need to redifine them for your need or remove.

**Rules**
```lua
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
{ rule = { class = "Gnome-commander"  },  properties = { screen = 1, tag = "Files"          }},
{ rule = { class = "Doublecmd"        },  properties = { screen = 1, tag = "Files"          }},
{ rule = { class = "Thunderbird"      },  properties = { screen = 1, tag = "MSG"            }},
{ rule = { class = "skype"            },  properties = { screen = 1, tag = "MSG"            }},
{ rule = { class = "Pac"              },  properties = { screen = 1, tag = "PAC"            }},
{ rule = { class = "libreoffice"      },  properties = { screen = 1, tag = "Work"           }},
{ rule = { class = "Gimp"             },  properties = { floating = true                    }},
```

### Themes

To change theme you need to change theme name and main colour in *theme.lua*


I created following themes:
* Blue   - 'blue'
* Gray   - 'gray'
* Green  - 'green'
* Purple - 'purple'
* Red    - 'red'
* Yellow - 'yellow'
* Zen    - 'zen'

*Screenshot:*
![PurpleTheme](/screenshot/purple.png)

### Keyboard

To configure keyboard layout you neet to make apropriate changes in *kb.lua*. 
Defaut layout: *US* and *RU*. 
And key combination: Alt+Space (Which can be defined in *rc.lua*, but this is the best I could think of)

### License

> Copyright (c) 2016 Dmitry Ivanov
>
> Licensed under the Apache License, Version 2.0 (the "License");
> you may not use this file except in compliance with the License.
> You may obtain a copy of the License at
> 
>     http://www.apache.org/licenses/LICENSE-2.0
> 
> Unless required by applicable law or agreed to in writing, software
> distributed under the License is distributed on an "AS IS" BASIS,
> WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> See the License for the specific language governing permissions and
> limitations under the License.
