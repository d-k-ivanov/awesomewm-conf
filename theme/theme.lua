theme 					= {}
theme.wallpaper 		= "~/.config/awesome/wallpapers/pas.jpg"
-- blue | gray | green | red | yellow | zen
theme.colour 			= "green"

--{{--- Style ------------------------------------------------------------------------------------------
cyan  														= "#7f4de6"
lblue 														= "#6c9eab"
black 														= "#3f3f3f"
lgrey 														= "#d2d2d2"
dgrey 														= "#333333"
white 														= "#ffffff"

dblue 														= "#00ccff"
gray															= "#7d7d7d"
green 														= "#84df19"
red   														= "#eb2f6d"
yellow														= "#f6be57"
zen															= "#cacaa8"

-- blue = dblue | gray = gray | green = dgreen | red = red | yellow = yellow | zen = zen
main_colour 												= green
	
theme.font                                  		= "Terminus 9"
theme.fg_normal                             		= "#AAAAAA"
--theme.fg_focus                              		= "#F0DFAF"
theme.fg_focus                              		= main_colour
theme.fg_urgent                             		= "#CC9393"
theme.bg_normal                             		= "#222222"
theme.bg_focus                              		= "#1E2320"
theme.bg_urgent                             		= "#3F3F3F"
theme.border_width                          		= "1"
theme.border_normal                         		= "#3F3F3F"
theme.border_focus                          		= main_colour
theme.border_marked                         		= "#CC9393"
theme.titlebar_bg_focus                     		= "#3F3F3F"
theme.titlebar_bg_normal                    		= "#3F3F3F"
theme.binclock_bg                           		= "#777e76"
theme.binclock_fga                          		= "#CCCCCC"
theme.binclock_fgi                          		= "#444444"
--theme.taglist_bg_focus                    		  = black 
theme.taglist_fg_focus                      		= main_colour 
theme.tasklist_bg_focus                     		= "#222222" 
theme.tasklist_fg_focus                     		= main_colour 
theme.textbox_widget_as_label_font_color    		= white 
theme.textbox_widget_margin_top             		= 1
theme.text_font_color_1                     		= green
theme.text_font_color_2                     		= main_colour 
theme.text_font_color_3                     		= white
theme.notify_font_color_1                   		= green
theme.notify_font_color_2                   		= main_colour 
theme.notify_font_color_3                   		= black
theme.notify_font_color_4                   		= white
theme.notify_font                           		= "Terminus 8"
theme.notify_fg                             		= theme.fg_normal
theme.notify_bg                             		= theme.bg_normal
theme.notify_border                         		= theme.border_focus
theme.awful_widget_bckgrd_color             		= dgrey
theme.awful_widget_border_color             		= dgrey
theme.awful_widget_color                    		= main_colour 
theme.awful_widget_gradien_color_1          		= orange
theme.awful_widget_gradien_color_2          		= orange
theme.awful_widget_gradien_color_3          		= orange
theme.awful_widget_height                   		= 14
theme.awful_widget_margin_top               		= 2

theme.mouse_finder_color 								= "#CC9393"

theme.menu_height 										= 16
theme.menu_width  										= 200

--{{--- Titlebar ------------------------------------------------------------------------------------------
theme.titlebar_close_button_focus  					= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/close_focus.png"
theme.titlebar_close_button_normal 					= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  		= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active 		= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  		= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive 		= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  		= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active 		= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  	= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive 	= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  	= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active 	= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  	= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive 	= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  	= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active 	= "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/theme/" .. theme.colour .. "/titlebar/maximized_normal_inactive.png"

--{{--- Taglist ------------------------------------------------------------------------------------------
theme.taglist_squares_sel   		= "~/.config/awesome/theme/" .. theme.colour .. "/taglist/squaref_a.png"
theme.taglist_squares_unsel 		= "~/.config/awesome/theme/" .. theme.colour .. "/taglist/square_a.png"

--{{--- Layout ------------------------------------------------------------------------------------------
theme.layout_tile       			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/tile.png"
theme.layout_tileleft   			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/tileleft.png"
theme.layout_tilebottom 			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/tilebottom.png"
theme.layout_tiletop    			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/tiletop.png"
theme.layout_fairv      			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/fairv.png"
theme.layout_fairh      			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/fairh.png"
theme.layout_spiral     			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/spiral.png"
theme.layout_dwindle    			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/dwindle.png"
theme.layout_max        			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/max.png"
theme.layout_fullscreen 			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/fullscreen.png"
theme.layout_magnifier  			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/magnifier.png"
theme.layout_floating   			= "~/.config/awesome/theme/" .. theme.colour .. "/layouts-huge/floating.png"

--{{--- Theme icons ------------------------------------------------------------------------------------------
theme.awesome_icon           		= "~/.config/awesome/theme/" .. theme.colour .. "/arch.png"
theme.menu_submenu_icon      		= "~/.config/awesome/theme/" .. theme.colour .. "/submenu.png"

--{{--- Battery icons ------------------------------------------------------------------------------------------
theme.battery_missing 				= "~/.config/awesome/theme/icons/battery/battery_missing.png"
theme.battery_empty 					= "~/.config/awesome/theme/icons/battery/battery_empty.png"
theme.battery_full 					= "~/.config/awesome/theme/icons/battery/battery_full.png"
theme.battery_1 						= "~/.config/awesome/theme/icons/battery/battery_1.png"
theme.battery_2 						= "~/.config/awesome/theme/icons/battery/battery_2.png"
theme.battery_3 						= "~/.config/awesome/theme/icons/battery/battery_3.png"
theme.battery_4 						= "~/.config/awesome/theme/icons/battery/battery_4.png"
theme.battery_5 						= "~/.config/awesome/theme/icons/battery/battery_5.png"
theme.battery_charging_empty 		= "~/.config/awesome/theme/icons/battery/battery_charging_empty.png"
theme.battery_charging_full 		= "~/.config/awesome/theme/icons/battery/battery_charging_full.png"
theme.battery_charging_1 			= "~/.config/awesome/theme/icons/battery/battery_charging_1.png"
theme.battery_charging_2 			= "~/.config/awesome/theme/icons/battery/battery_charging_2.png"
theme.battery_charging_3 			= "~/.config/awesome/theme/icons/battery/battery_charging_3.png"
theme.battery_charging_4 			= "~/.config/awesome/theme/icons/battery/battery_charging_4.png"
theme.battery_charging_5 			= "~/.config/awesome/theme/icons/battery/battery_charging_5.png"

--{{--- Volume icons ------------------------------------------------------------------------------------------
theme.volume_high						= "~/.config/awesome/theme/icons/volume/volume-high.png"
theme.volume_medium					= "~/.config/awesome/theme/icons/volume/volume-medium.png"
theme.volume_low						= "~/.config/awesome/theme/icons/volume/volume-low.png"
theme.volume_muted					= "~/.config/awesome/theme/icons/volume/volume-muted.png"
theme.volume_off						= "~/.config/awesome/theme/icons/volume/volume-off.png"

--{{--- User icons ------------------------------------------------------------------------------------------

theme.package_icon					= "~/.config/awesome/theme/icons/apps/package.png"
theme.packages_icon					= "~/.config/awesome/theme/icons/apps/packages.png"
theme.settings_icon					= "~/.config/awesome/theme/icons/apps/settings.png"
theme.system_monitor_icon			= "~/.config/awesome/theme/icons/apps/system_monitor.png"
theme.terminal_icon					= "~/.config/awesome/theme/icons/apps/terminal.png"
theme.terminator_icon				= "~/.config/awesome/theme/icons/apps/terminator.png"

theme.manual_icon						= "~/.config/awesome/theme/icons/apps/manual.png"
theme.edit_icon						= "~/.config/awesome/theme/icons/apps/edit.png"
theme.reload_icon						= "~/.config/awesome/theme/icons/apps/reload.png"
theme.quit_icon						= "~/.config/awesome/theme/icons/apps/quit.png"
theme.shutdown_icon					= "~/.config/awesome/theme/icons/apps/shutdown.png"
theme.restart_icon					= "~/.config/awesome/theme/icons/apps/restart.png"
theme.hibernate_icon					= "~/.config/awesome/theme/icons/apps/hibernate.png"

--{{----------------------------------------------------------------------------

return theme
