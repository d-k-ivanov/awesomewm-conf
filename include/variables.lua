fme_started   = false
fms_started   = false
fmd_started   = false
fmx_started   = false

terminal      = "xterm"
terminal2     = "terminator"
editor        = os.getenv("EDITOR") or "vim"
editor_cmd    = terminal .. " -e " .. editor
browser       = "google-chrome-stable"
fme           = "spacefm"
fms           = "gnome-commander"
fmd           = "doublecmd"
fmx           = "pcmanfm"
stmux         = terminal .. " -e tmux -2"