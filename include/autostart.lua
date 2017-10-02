--{{---| Rules |---------------------------------------------------------------------------------------------------------
-- runonce.lua shoul be placed in extentions or widgets
--
-- autostart - object which implements run("program_name") method.

local autostart = require("runonce")

--{{---| Java GUI's fix ---}}---
autostart.run("wmname LG3D")

autostart.run("skypeforlinux")
--autostart.run("dropbox")
autostart.run("nm-applet")
autostart.run("jetbrains-toolbox --minimize")
--autostart.run("/home/id/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize")
--autostart.run"empathy")
--autostart.run("pidgin")
autostart.run("slack")
autostart.run("telegram-desktop")
autostart.run("thunderbird")
-- autostart.run("firefox")
-- autostart.run("google-chrome-stable")
--autostart.run("gnome-commander")
--autostart.run("teamviewer")
--autostart.run("pac")
--autostart.run("subl")
--autostart.run("sublime_text")
autostart.run("shutter --min_at_startup")
autostart.run("remmina -i")
autostart.run("goldendict")
autostart.run("parcellite")
autostart.run("xscreensaver -no-splash")
--autostart.run("yakyak")
