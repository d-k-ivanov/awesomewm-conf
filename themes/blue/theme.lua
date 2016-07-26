-------------------------------
--  "default" awesome theme  --
-------------------------------

-- {{{ Main
theme = {}
theme.wallpaper = "~/.config/awesome/wallpapers/pas.jpg"
theme.name = "blue"
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

-- Battery icons:
theme.battery_missing 			= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_missing.png"
theme.battery_empty 			= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_empty.png"
theme.battery_full 				= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_full.png"

theme.battery_1 				= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_1.png"
theme.battery_2 				= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_2.png"
theme.battery_3 				= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_3.png"
theme.battery_4 				= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_4.png"
theme.battery_5 				= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_5.png"

theme.battery_charging_empty 	= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_charging_empty.png"
theme.battery_charging_full 	= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_charging_full.png"

theme.battery_charging_1 		= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_charging_1.png"
theme.battery_charging_2 		= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_charging_2.png"
theme.battery_charging_3 		= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_charging_3.png"
theme.battery_charging_4 		= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_charging_4.png"
theme.battery_charging_5 		= "~/.config/awesome/themes/" .. theme.name .. "/icons/battery/battery_charging_5.png"
-- End of battery icons

theme.volume_high				= "~/.config/awesome/themes/" .. theme.name .. "/icons/volume/volume-high.png"
theme.volume_medium				= "~/.config/awesome/themes/" .. theme.name .. "/icons/volume/volume-medium.png"
theme.volume_low				= "~/.config/awesome/themes/" .. theme.name .. "/icons/volume/volume-low.png"
theme.volume_muted				= "~/.config/awesome/themes/" .. theme.name .. "/icons/volume/volume-muted.png"
theme.volume_off				= "~/.config/awesome/themes/" .. theme.name .. "/icons/volume/volume-off.png"


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
theme.menu_width  = 150
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = "~/.config/awesome/themes/" .. theme.name .. "/taglist/squaref_a.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/" .. theme.name .. "/taglist/square_a.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "~/.config/awesome/themes/" .. theme.name .. "/icons/arch.png"
theme.menu_submenu_icon      = "~/.config/awesome/themes/" .. theme.name .. "/icons/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/tile.png"
theme.layout_tileleft   = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/tileleft.png"
theme.layout_tilebottom = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/tilebottom.png"
theme.layout_tiletop    = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/tiletop.png"
theme.layout_fairv      = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/fairv.png"
theme.layout_fairh      = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/fairh.png"
theme.layout_spiral     = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/spiral.png"
theme.layout_dwindle    = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/dwindle.png"
theme.layout_max        = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/max.png"
theme.layout_fullscreen = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/fullscreen.png"
theme.layout_magnifier  = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/magnifier.png"
theme.layout_floating   = "~/.config/awesome/themes/" .. theme.name .. "/layouts-huge/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/themes/" .. theme.name .. "/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
