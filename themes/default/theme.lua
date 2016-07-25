-------------------------------
--  "default" awesome theme  --
-------------------------------

-- {{{ Main
theme = {}
theme.wallpaper = "~/.config/awesome/wallpapers/pas.jpg"
-- }}}

-- {{{ Styles
theme.font      = "sans 8"

-- {{{ Colors
theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#F0DFAF"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#3F3F3F"
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 2
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.fg_widget        = "#AECF96"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.bg_widget        = "#494B4F"
theme.border_widget    = "#3F3F3F"

--theme.widget_temp        = "~/.config/awesome/themes/default/icons-color/temp.png"
--theme.widget_uptime      = "~/.config/awesome/themes/default/icons-color/ac.png"
--theme.widget_cpu         = "~/.config/awesome/themes/default/icons-color/cpu.png"
--theme.widget_weather     = "~/.config/awesome/themes/default/icons-color/dish.png"
--theme.widget_fs          = "~/.config/awesome/themes/default/icons-color/fs.png"
--theme.widget_mem         = "~/.config/awesome/themes/default/icons-color/mem.png"
--theme.widget_fs          = "~/.config/awesome/themes/default/icons-color/fs.png"
--theme.widget_note        = "~/.config/awesome/themes/default/icons-color/note.png"
--theme.widget_note_on     = "~/.config/awesome/themes/default/icons-color/note_on.png"
--theme.widget_netdown     = "~/.config/awesome/themes/default/icons-color/net_down.png"
--theme.widget_netup       = "~/.config/awesome/themes/default/icons-color/net_up.png"
--theme.widget_mail        = "~/.config/awesome/themes/default/icons-color/mail.png"
--theme.widget_batt        = "~/.config/awesome/themes/default/icons-color/bat.png"
--theme.widget_clock       = "~/.config/awesome/themes/default/icons-color/clock.png"
--theme.widget_vol         = "~/.config/awesome/themes/default/icons-color/spkr.png"

theme.widget_batfull	= "~/.config/awesome/themes/default/icons/battery/battery-green.png"
theme.widget_batmed 	= "~/.config/awesome/themes/default/icons/battery/battery-green.png"
theme.widget_batlow 	= "~/.config/awesome/themes/default/icons/battery/battery-green.png"
theme.widget_batempty 	= "~/.config/awesome/themes/default/icons/battery/battery-green.png"
theme.widget_ac 		= "~/.config/awesome/themes/default/icons/battery/battery-green.png"

-- Battery icons:
theme.battery_missing 			= "~/.config/awesome/themes/default/icons/battery/battery_missing.png"
theme.battery_empty 			= "~/.config/awesome/themes/default/icons/battery/battery_empty.png"
theme.battery_full 				= "~/.config/awesome/themes/default/icons/battery/battery_full.png"

theme.battery_1 				= "~/.config/awesome/themes/default/icons/battery/battery_1.png"
theme.battery_2 				= "~/.config/awesome/themes/default/icons/battery/battery_2.png"
theme.battery_3 				= "~/.config/awesome/themes/default/icons/battery/battery_3.png"
theme.battery_4 				= "~/.config/awesome/themes/default/icons/battery/battery_4.png"
theme.battery_5 				= "~/.config/awesome/themes/default/icons/battery/battery_5.png"

theme.battery_charging_empty 	= "~/.config/awesome/themes/default/icons/battery/battery_charging_empty.png"
theme.battery_charging_full 	= "~/.config/awesome/themes/default/icons/battery/battery_charging_full.png"

theme.battery_charging_1 		= "~/.config/awesome/themes/default/icons/battery/battery_charging_1.png"
theme.battery_charging_2 		= "~/.config/awesome/themes/default/icons/battery/battery_charging_2.png"
theme.battery_charging_3 		= "~/.config/awesome/themes/default/icons/battery/battery_charging_3.png"
theme.battery_charging_4 		= "~/.config/awesome/themes/default/icons/battery/battery_charging_4.png"
theme.battery_charging_5 		= "~/.config/awesome/themes/default/icons/battery/battery_charging_5.png"
-- End of battery icons

theme.widget_volume				= "~/.config/awesome/themes/default/icons/volume/volume-green.png"

-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = "~/.config/awesome/themes/default/taglist/squaref_a-green.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/default/taglist/square_a-green.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "~/.config/awesome/themes/default/icons/arch-green.png"
theme.menu_submenu_icon      = "~/.config/awesome/themes/default/icons/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = "~/.config/awesome/themes/default/layouts-huge/tile-green.png"
theme.layout_tileleft   = "~/.config/awesome/themes/default/layouts-huge/tileleft-green.png"
theme.layout_tilebottom = "~/.config/awesome/themes/default/layouts-huge/tilebottom-green.png"
theme.layout_tiletop    = "~/.config/awesome/themes/default/layouts-huge/tiletop-green.png"
theme.layout_fairv      = "~/.config/awesome/themes/default/layouts-huge/fairv-green.png"
theme.layout_fairh      = "~/.config/awesome/themes/default/layouts-huge/fairh-green.png"
theme.layout_spiral     = "~/.config/awesome/themes/default/layouts-huge/spiral-green.png"
theme.layout_dwindle    = "~/.config/awesome/themes/default/layouts-huge/dwindle-green.png"
theme.layout_max        = "~/.config/awesome/themes/default/layouts-huge/max-green.png"
theme.layout_fullscreen = "~/.config/awesome/themes/default/layouts-huge/fullscreen-green.png"
theme.layout_magnifier  = "~/.config/awesome/themes/default/layouts-huge/magnifier-green.png"
theme.layout_floating   = "~/.config/awesome/themes/default/layouts-huge/floating-green.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "~/.config/awesome/themes/default/titlebar/close_focus-green.png"
theme.titlebar_close_button_normal = "~/.config/awesome/themes/default/titlebar/close_normal-green.png"

theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/themes/default/titlebar/ontop_focus_active-green.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/themes/default/titlebar/ontop_normal_active-green.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/themes/default/titlebar/ontop_focus_inactive-green.png"
theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/themes/default/titlebar/ontop_normal_inactive-green.png"

theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/themes/default/titlebar/sticky_focus_active-green.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/themes/default/titlebar/sticky_normal_active-green.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/themes/default/titlebar/sticky_focus_inactive-green.png"
theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/themes/default/titlebar/sticky_normal_inactive-green.png"

theme.titlebar_floating_button_focus_active  = "~/.config/awesome/themes/default/titlebar/floating_focus_active-green.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/themes/default/titlebar/floating_normal_active-green.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/themes/default/titlebar/floating_focus_inactive-green.png"
theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/themes/default/titlebar/floating_normal_inactive-green.png"

theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/themes/default/titlebar/maximized_focus_active-green.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/themes/default/titlebar/maximized_normal_active-green.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/themes/default/titlebar/maximized_focus_inactive-green.png"
theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/themes/default/titlebar/maximized_normal_inactive-green.png"
-- }}}
-- }}}

return theme
