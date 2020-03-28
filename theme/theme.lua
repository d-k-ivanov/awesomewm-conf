local config_dir    = gears.filesystem.get_dir("config")

theme               = {}
theme.wallpaper     = config_dir .. "theme/wallpapers/pas.jpg"

-- blue | gray | green | purple | red | yellow | zen
theme.colour    = "white_gray"

--{{--- Style ---------------------------------------------------------------------------------------------------------------------------
cyan        = "#7f4de6"
lblue       = "#6c9eab"
black       = "#3f3f3f"
lgrey       = "#d2d2d2"
dgrey       = "#333333"
white       = "#ffffff"

dblue       = "#00ccff"
gray        = "#7d7d7d"
green       = "#84df19"
red         = "#eb2f6d"
yellow      = "#f6be57"
zen         = "#cacaa8"
purple      = "#8476ad"
white_gray  = "#d3dae3"
bbblluu     = "#44849d"

-- blue     = dblue
-- gray     = gray
-- green    = dgreen
-- purple   = purple
-- red      = red
-- yellow   = yellow
-- zen      = zen
main_colour = white_gray

--theme.font    = "Consolas 9"
--theme.font    = "Terminus 9"
theme.font      = "Inconsolata 14"

theme.fg_normal                             = "#AAAAAA"
--theme.fg_focus                            = "#F0DFAF"
theme.fg_focus                              = main_colour
theme.fg_urgent                             = "#CC9393"
theme.bg_normal                             = "#222222"
theme.bg_focus                              = "#1E2320"
theme.bg_urgent                             = "#3F3F3F"
theme.border_width                          = "1"
theme.border_normal                         = "#3F3F3F"
theme.border_focus                          = main_colour
theme.border_marked                         = "#CC9393"
theme.titlebar_bg_focus                     = "#3F3F3F"
theme.titlebar_bg_normal                    = "#3F3F3F"
theme.binclock_bg                           = "#777e76"
theme.binclock_fga                          = "#CCCCCC"
theme.binclock_fgi                          = "#444444"
theme.taglist_bg_focus                      = dgrey
theme.taglist_fg_focus                      = main_colour
theme.tasklist_bg_focus                     = "#222222"
--theme.tasklist_bg_focus                   = "#FFFFFF"
theme.tasklist_bg_focus                     = dgrey
theme.tasklist_fg_focus                     = main_colour
theme.textbox_widget_as_label_font_color    = white
theme.textbox_widget_margin_top             = dpi(1)
theme.text_font_color_1                     = green
theme.text_font_color_2                     = main_colour
theme.text_font_color_3                     = white
theme.notify_font_color_1                   = green
theme.notify_font_color_2                   = main_colour
theme.notify_font_color_3                   = black
theme.notify_font_color_4                   = white
-- theme.notify_font                        = "Consolas 12"
-- theme.notify_font                        = "Terminus 12"
theme.notify_font                           = "Inconsolata 14"
theme.notify_fg                             = theme.fg_normal
theme.notify_bg                             = theme.bg_normal
theme.notify_border                         = theme.border_focus
theme.awful_widget_bckgrd_color             = dgrey
theme.awful_widget_border_color             = dgrey
theme.awful_widget_color                    = main_colour
theme.awful_widget_gradien_color_1          = orange
theme.awful_widget_gradien_color_2          = orange
theme.awful_widget_gradien_color_3          = orange
--theme.awful_widget_height                 = dpi(14)
--theme.awful_widget_margin_top             = dpi(2)

theme.mouse_finder_color                    = "#CC9393"

theme.menu_height                           = dpi(24)
theme.menu_width                            = dpi(250)

-- Temporary
--theme.bg_systray                          = white
theme.systray_icon_spacing                  = dpi(5)

--{{--- Titlebar ------------------------------------------------------------------------------------------------------------------------
theme.titlebar_close_button_focus               = "~/.config/awesome/theme/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = "~/.config/awesome/theme/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active        = "~/.config/awesome/theme/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = "~/.config/awesome/theme/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = "~/.config/awesome/theme/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = "~/.config/awesome/theme/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active       = "~/.config/awesome/theme/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = "~/.config/awesome/theme/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = "~/.config/awesome/theme/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = "~/.config/awesome/theme/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active     = "~/.config/awesome/theme/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = "~/.config/awesome/theme/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = "~/.config/awesome/theme/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = "~/.config/awesome/theme/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active    = "~/.config/awesome/theme/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = "~/.config/awesome/theme/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/theme/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/theme/titlebar/maximized_normal_inactive.png"

--{{--- Taglist -------------------------------------------------------------------------------------------------------------------------
theme.taglist_squares_sel       = "~/.config/awesome/theme/tags/squaref_a.png"
theme.taglist_squares_unsel     = "~/.config/awesome/theme/tags/square_a.png"

--{{--- Layout --------------------------------------------------------------------------------------------------------------------------
theme.layout_tile               = config_dir .. "theme/icons/layouts/tile.png"
theme.layout_tileleft           = config_dir .. "theme/icons/layouts/tileleft.png"
theme.layout_tilebottom         = config_dir .. "theme/icons/layouts/tilebottom.png"
theme.layout_tiletop            = config_dir .. "theme/icons/layouts/tiletop.png"
theme.layout_fairv              = config_dir .. "theme/icons/layouts/fairv.png"
theme.layout_fairh              = config_dir .. "theme/icons/layouts/fairh.png"
theme.layout_spiral             = config_dir .. "theme/icons/layouts/spiral.png"
theme.layout_dwindle            = config_dir .. "theme/icons/layouts/dwindle.png"
theme.layout_max                = config_dir .. "theme/icons/layouts/max.png"
theme.layout_fullscreen         = config_dir .. "theme/icons/layouts/fullscreen.png"
theme.layout_magnifier          = config_dir .. "theme/icons/layouts/magnifier.png"
theme.layout_floating           = config_dir .. "theme/icons/layouts/floating.png"

--{{--- Lain layout ---------------------------------------------------------------------------------------------------------------------
--theme.useless_gap_width       = 9
--theme.layout_cascade          = "~/.config/awesome/theme/layouts-lain/cascade.png"
--theme.layout_cascadetile      = "~/.config/awesome/theme/layouts-lain/cascadebrowse.png"
--theme.layout_centerfair       = "~/.config/awesome/theme/layouts-lain/centerfair.png"
--theme.layout_centerhwork      = "~/.config/awesome/theme/layouts-lain/centerwork.png"
--theme.layout_centerwork       = "~/.config/awesome/theme/layouts-lain/floating.png"
--theme.layout_centerworkd      = "~/.config/awesome/theme/layouts-lain/floating.png"
--theme.layout_termfair         = "~/.config/awesome/theme/layouts-lain/termfair.png"
--theme.layout_uselessfair      = "~/.config/awesome/theme/layouts-lain/floating.png"
--theme.layout_uselesspiral     = "~/.config/awesome/theme/layouts-lain/floating.png"
--theme.layout_uselesstile      = "~/.config/awesome/theme/layouts-lain/floating.png"

--{{--- Theme icons ---------------------------------------------------------------------------------------------------------------------
theme.awesome_icon              = "~/.config/awesome/theme/blank.png"
--theme.awesome_icon            = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus/48x48/places/distributor-logo-gentoo.svg"
theme.menu_submenu_icon         = "~/.config/awesome/theme/submenu.png"
theme.icon_theme                = "Papirus"

--{{--- Battery icons -------------------------------------------------------------------------------------------------------------------
theme.battery_missing           = "~/.config/awesome/theme/icons/battery/battery_missing.png"
theme.battery_empty             = "~/.config/awesome/theme/icons/battery/battery_empty.png"
theme.battery_full              = "~/.config/awesome/theme/icons/battery/battery_full.png"
theme.battery_1                 = "~/.config/awesome/theme/icons/battery/battery_1.png"
theme.battery_2                 = "~/.config/awesome/theme/icons/battery/battery_2.png"
theme.battery_3                 = "~/.config/awesome/theme/icons/battery/battery_3.png"
theme.battery_4                 = "~/.config/awesome/theme/icons/battery/battery_4.png"
theme.battery_5                 = "~/.config/awesome/theme/icons/battery/battery_5.png"
theme.battery_charging_empty    = "~/.config/awesome/theme/icons/battery/battery_charging_empty.png"
theme.battery_charging_full     = "~/.config/awesome/theme/icons/battery/battery_charging_full.png"
theme.battery_charging_1        = "~/.config/awesome/theme/icons/battery/battery_charging_1.png"
theme.battery_charging_2        = "~/.config/awesome/theme/icons/battery/battery_charging_2.png"
theme.battery_charging_3        = "~/.config/awesome/theme/icons/battery/battery_charging_3.png"
theme.battery_charging_4        = "~/.config/awesome/theme/icons/battery/battery_charging_4.png"
theme.battery_charging_5        = "~/.config/awesome/theme/icons/battery/battery_charging_5.png"

--[[
theme.battery_missing           = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-missing.svg"
theme.battery_empty             = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-empty.svg"
theme.battery_full              = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-full.svg"
theme.battery_1                 = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-empty.sv"
theme.battery_2                 = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-caution.svg"
theme.battery_3                 = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-low.svg"
theme.battery_4                 = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-good.svg"
theme.battery_5                 = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-full.svg"
theme.battery_charging_empty    = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-empty-charging.svg"
theme.battery_charging_full     = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-ac-adapter.svg"
theme.battery_charging_1        = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-empty-charging.svg"
theme.battery_charging_2        = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-caution-charging.svg"
theme.battery_charging_3        = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-low-charging.svg"
theme.battery_charging_4        = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-good-charging.svg"
theme.battery_charging_5        = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/status/battery-full-charging.svg"
]]

--{{--- Volume icons --------------------------------------------------------------------------------------------------------------------
theme.volume_high   = "~/.config/awesome/theme/icons/volume/volume-high.png"
theme.volume_medium = "~/.config/awesome/theme/icons/volume/volume-medium.png"
theme.volume_low    = "~/.config/awesome/theme/icons/volume/volume-low.png"
theme.volume_muted  = "~/.config/awesome/theme/icons/volume/volume-muted.png"
theme.volume_off    = "~/.config/awesome/theme/icons/volume/volume-off.png"

--[[theme.volume_high   = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Dark/symbolic/status/audio-volume-high-symbolic.svg"
theme.volume_medium     = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Dark/symbolic/status/audio-volume-high-symbolic.svg"
theme.volume_low        = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Dark/symbolic/status/audio-volume-medium-symbolic.svg"
theme.volume_off        = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Dark/symbolic/status/audio-volume-low-symbolic.svg"
theme.volume_muted      = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Dark/symbolic/status/audio-volume-muted-symbolic.svg"]]

--{{--- Taskbar icons -------------------------------------------------------------------------------------------------------------------
theme.wclock_icon       = "~/.config/awesome/theme/icons/bar/clock.png"

--{{--- User icons ----------------------------------------------------------------------------------------------------------------------
theme.system_monitor_icon   = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/apps/htop.svg"
theme.terminal_icon         = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/apps/xterm.svg"
theme.terminator_icon       = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/apps/terminator.svg"
--theme.dropbox_icon        = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus-Light/48x48/apps/dropbox.svg"

theme.awesone_default       = "~/.config/awesome/theme/icons/awesome_logo.svg"
theme.manual_icon           = "~/.config/awesome/theme/icons/apps/manual.png"
theme.edit_icon             = "~/.config/awesome/theme/icons/apps/edit.png"
theme.reload_icon           = "~/.config/awesome/theme/icons/apps/reload.png"
theme.quit_icon             = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus/48x48/apps/system-log-out.svg"
theme.hibernate_icon        = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus/48x48/apps/system-hibernate.svg"
theme.restart_icon          = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus/48x48/apps/system-restart.svg"
theme.shutdown_icon         = "~/.config/awesome/theme/icons/papirus-icon-theme/Papirus/48x48/apps/system-shutdown.svg"

--{{-------------------------------------------------------------------------------------------------------------------------------------

return theme
