--{{---| Java GUI's fix |--------------------------------------------------------------------------------------------------
awful.util.spawn_with_shell("wmname LG3D")

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
  local findme      = cmd
  local firstspace  = cmd:find(" ")
  if firstspace then
    findme    = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

--{{---| Rules |-----------------------------------------------------------------------------------------------------------
-- run_once(prg,arg_string,pname,screen)
--run_once("skypeforlinux")
run_once("dropbox")
run_once("nm-applet")
--run_once("jetbrains-toolbox --minimize")
--run_once("/home/id/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize")
--run_once("empathy")
--run_once("pidgin")
run_once("slack")
--run_once("telegram-desktop")
run_once("thunderbird")
-- run_once("firefox")
-- run_once("google-chrome-stable")
--run_once("gnome-commander")
--run_once("teamviewer12")
--run_once("pac")
--run_once("subl")
--run_once("sublime_text")
run_once("shutter --min_at_startup")
run_once("remmina -i")
run_once("goldendict")
--run_once("clipit")
run_once("xscreensaver -no-splash")
--run_once("yakyak")


