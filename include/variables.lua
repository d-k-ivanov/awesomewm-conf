fme_started   = false
fms_started   = false
fmd_started   = false
fmx_started   = false

terminal2      = "tilda"
--terminal2     = "terminator"
--terminal     = "sakura"
terminal     = "xterm"
editor        = os.getenv("EDITOR") or "vim"
editor_cmd    = terminal .. " -e " .. editor
browser       = "google-chrome-stable"
fme           = "spacefm"
fms           = "gnome-commander"
fmd           = "doublecmd"
fmx           = "pcmanfm"
stmux         = terminal .. " -e tmux -2"
