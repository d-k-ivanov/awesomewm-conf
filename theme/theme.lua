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
theme.fg_focus                              		= "#F0DFAF"
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

theme.goldendict_icon           	= "~/.config/awesome/theme/icons/app/goldendict.png"
theme.books_icon                	= "~/.config/awesome/theme/icons/app/books_brown.png"
theme.xfe_icon                  	= "~/.config/awesome/theme/icons/app/xfe.png"
theme.xferoot_icon              	= "~/.config/awesome/theme/icons/app/xfe-root.png"
theme.htop_icon                 	= "~/.config/awesome/theme/icons/app/activity_monitor.png"
theme.audacious_icon            	= "~/.config/awesome/theme/icons/app/audacious.png"
theme.deadbeef_icon             	= "~/.config/awesome/theme/icons/app/deadbeef.png"
theme.vlc_icon                  	= "~/.config/awesome/theme/icons/app/vlc.png"
theme.xfburn_icon               	= "~/.config/awesome/theme/icons/app/xfburn.png"
theme.myedu_icon               	= "~/.config/awesome/theme/icons/app/nucleus24.png"
theme.ideaCE_icon               	= "~/.config/awesome/theme/icons/app/ideaCE.png"
theme.ideaUE_icon               	= "~/.config/awesome/theme/icons/app/ideaUE.png"
theme.pycharm_icon              	= "~/.config/awesome/theme/icons/app/PyCharm_16.png"
theme.emacs_icon                	= "~/.config/awesome/theme/icons/app/emacs.png"
theme.sublime_icon              	= "~/.config/awesome/theme/icons/app/SublimeText2old.png"
theme.eclipse_icon              	= "~/.config/awesome/theme/icons/app/eclipse.png"
theme.galculator_icon           	= "~/.config/awesome/theme/icons/app/accessories-calculator.png"
theme.spacefm_icon              	= "~/.config/awesome/theme/icons/app/file-manager.png"
theme.gedit_icon                	= "~/.config/awesome/theme/icons/app/text-editor.png"
theme.terminal_icon              = "~/.config/awesome/theme/icons/app/gnome-terminal.png"
theme.terminalroot_icon          = "~/.config/awesome/theme/icons/app/gksu-root-terminal.png"
theme.system_icon                = "~/.config/awesome/theme/icons/app/processor.png"
theme.android_icon               = "~/.config/awesome/theme/icons/app/android_hdpi.png"
theme.gcolor_icon               	= "~/.config/awesome/theme/icons/app/icon.png"
theme.gimp_icon                 	= "~/.config/awesome/theme/icons/app/gimp.png"
theme.inkscape_icon             	= "~/.config/awesome/theme/icons/app/inkscape.png"
theme.recordmydesktop_icon      	= "~/.config/awesome/theme/icons/app/gtk-recordmydesktop.png"
theme.screengrab_icon           	= "~/.config/awesome/theme/icons/app/screengrab.png"
theme.xmag_icon                 	= "~/.config/awesome/theme/icons/app/xmag.png"
theme.mydevmenu_icon            	= "~/.config/awesome/theme/icons/app/safety_helmet.png"
theme.mymultimediamenu_icon     	= "~/.config/awesome/theme/icons/app/emblem_multimedia.png"
theme.mygraphicsmenu_icon       	= "~/.config/awesome/theme/icons/app/graphics.png"
theme.nvidia_icon               	= "~/.config/awesome/theme/icons/app/nvidia-settings.png"
theme.myofficemenu_icon         	= "~/.config/awesome/theme/icons/app/applications_office.png"
theme.mytoolsmenu_icon          	= "~/.config/awesome/theme/icons/app/tool_box.png"
theme.mywebmenu_icon            	= "~/.config/awesome/theme/icons/app/web.png"
theme.mysettingsmenu_icon       	= "~/.config/awesome/theme/icons/app/hammer_screwdriver.png"
-- theme.celestia_icon          	 = "~/.config/awesome/theme/icons/app/celestia.png"
-- theme.geogebra_icon          	 = "~/.config/awesome/theme/icons/app/geogebra.png"
theme.rosetta_icon              	= "~/.config/awesome/theme/icons/app/rosetta.png"
theme.stellarium_icon           	= "~/.config/awesome/theme/icons/app/stellarium.png"
theme.mathematica_icon          	= "~/.config/awesome/theme/icons/app/Mathematica_Icon.png"
theme.acroread_icon             	= "~/.config/awesome/theme/icons/app/acroread.png"
theme.djview_icon               	= "~/.config/awesome/theme/icons/app/djvulibre-djview4.png"
theme.kchmviewer_icon           	= "~/.config/awesome/theme/icons/app/kchmviewer.png"
theme.leafpad_icon              	= "~/.config/awesome/theme/icons/app/leafpad.png"
theme.librebase_icon            	= "~/.config/awesome/theme/icons/app/libreoffice-base.png"
theme.librecalc_icon            	= "~/.config/awesome/theme/icons/app/libreoffice-calc.png"
theme.libredraw_icon            	= "~/.config/awesome/theme/icons/app/libreoffice-draw.png"
theme.libreimpress_icon         	= "~/.config/awesome/theme/icons/app/libreoffice-impress.png"
theme.libremath_icon            	= "~/.config/awesome/theme/icons/app/libreoffice-math.png"
theme.librewriter_icon          	= "~/.config/awesome/theme/icons/app/libreoffice-writer.png"
theme.gparted_icon              	= "~/.config/awesome/theme/icons/app/gparted.png"
theme.peazip_icon               	= "~/.config/awesome/theme/icons/app/PeaZip.png"
theme.teamviewer_icon           	= "~/.config/awesome/theme/icons/app/teamview.png"
theme.virtualbox_icon           	= "~/.config/awesome/theme/icons/app/virtualbox.png"
-- theme.vmware_icon            	 = "~/.config/awesome/theme/icons/app/vmware-workstation.png"
theme.unetbootin_icon           	= "~/.config/awesome/theme/icons/app/unetbootin.png"
theme.cups_icon                 	= "~/.config/awesome/theme/icons/app/cupsprinter.png"
theme.java_icon                 	= "~/.config/awesome/theme/icons/app/sun_java.png"
theme.qt_icon                   	= "~/.config/awesome/theme/icons/app/qtassistant.png"
theme.filezilla_icon            	= "~/.config/awesome/theme/icons/app/filezilla.png"
theme.firefox_icon              	= "~/.config/awesome/theme/icons/app/firefox.png"
theme.thunderbird_icon          	= "~/.config/awesome/theme/icons/app/thunderbird.png"
theme.luakit_icon               	= "~/.config/awesome/theme/icons/app/luakit.png"
theme.gajim_icon                	= "~/.config/awesome/theme/icons/app/gajim.png"
theme.skype_icon                	= "~/.config/awesome/theme/icons/app/skype.png"
theme.vidalia_icon              	= "~/.config/awesome/theme/icons/app/vidalia_icon.png"
theme.weechat_icon              	= "~/.config/awesome/theme/icons/app/weechat.png"
theme.meld_icon                 	= "~/.config/awesome/theme/icons/app/meld.png"
theme.umplayer_icon             	= "~/.config/awesome/theme/icons/app/umplayer.png"
theme.qalculate_icon            	= "~/.config/awesome/theme/icons/app/qalculate.png"
theme.wicd_icon                 	= "~/.config/awesome/theme/icons/app/wicd.png"
theme.opera_icon                	= "~/.config/awesome/theme/icons/app/opera.png"
theme.qtcreator_icon            	= "~/.config/awesome/theme/icons/app/qtcreator.png"
theme.florence_icon             	= "~/.config/awesome/theme/icons/app/keyboard.png"
theme.texworks_icon             	= "~/.config/awesome/theme/icons/app/TeXworks.png"
theme.vym_icon                  	= "~/.config/awesome/theme/icons/app/vym.png"
theme.wmsmixer_icon             	= "~/.config/awesome/theme/icons/app/wmsmixer.png"
theme.cherrytree_icon           	= "~/.config/awesome/theme/icons/app/cherrytree.png"
theme.scantailor_icon           	= "~/.config/awesome/theme/icons/app/scantailor.png"
theme.gucharmap_icon            	= "~/.config/awesome/theme/icons/app/gucharmap.png"
theme.sigil_icon                	= "~/.config/awesome/theme/icons/app/sigil.png"
theme.dwb_icon                  	= "~/.config/awesome/theme/icons/app/dwb.png"
theme.qpdfview_icon             	= "~/.config/awesome/theme/icons/app/qpdfview.png"
theme.ghex_icon                 	= "~/.config/awesome/theme/icons/app/ghex.png"
theme.qtlinguist_icon           	= "~/.config/awesome/theme/icons/app/linguist.png"
theme.xfw_icon                  	= "~/.config/awesome/theme/icons/app/xfw.xpm"
theme.free42_icon               	= "~/.config/awesome/theme/icons/app/free42.png"
theme.fontypython_icon          	= "~/.config/awesome/theme/icons/app/fontypython.png"
theme.windows_icon              	= "~/.config/awesome/theme/icons/app/windows.png"
theme.tinymount_icon            	= "~/.config/awesome/theme/icons/app/tinymount.png"
theme.pgadmin3_icon             	= "~/.config/awesome/theme/icons/app/pgadmin3.png"
theme.chromium_icon             	= "~/.config/awesome/theme/icons/app/chromium.png"
theme.dropbox_icon              	= "~/.config/awesome/theme/icons/app/dropbox.png"
theme.gpick_icon                	= "~/.config/awesome/theme/icons/app/gpick.png"
theme.projects_icon             	= "~/.config/awesome/theme/icons/app/projects.png"
theme.qbittorrent_icon          	= "~/.config/awesome/theme/icons/app/qbittorrent.png"
theme.tkdiff_icon               	= "~/.config/awesome/theme/icons/app/tkdiff.png"
theme.kdiff3_icon               	= "~/.config/awesome/theme/icons/app/kdiff3.png"
theme.rubymine_icon             	= "~/.config/awesome/theme/icons/app/rubymine.png"
theme.multiplemonitors_icon     	= "~/.config/awesome/theme/icons/app/multiple_monitors.png"
theme.xnview_icon               	= "~/.config/awesome/theme/icons/app/xnview_2.png"
theme.mystuffmenu_icon          	= "~/.config/awesome/theme/icons/app/creative_suite.png"
theme.assembler_icon            	= "~/.config/awesome/theme/icons/app/assembler_icon.png"
theme.dlang_icon                	= "~/.config/awesome/theme/icons/app/dlang.png"
theme.erlang_icon               	= "~/.config/awesome/theme/icons/app/erlang.png"
theme.databases_icon            	= "~/.config/awesome/theme/icons/app/databases.png"
theme.ruby_icon                 	= "~/.config/awesome/theme/icons/app/ruby.png"
theme.linux_icon                	= "~/.config/awesome/theme/icons/app/linux.png"
theme.html_icon                 	= "~/.config/awesome/theme/icons/app/html.png"
theme.androidmobile_icon        	= "~/.config/awesome/theme/icons/app/android.png"
theme.quiterss_icon             	= "~/.config/awesome/theme/icons/app/quiterss.png"
theme.anki_icon                 	= "~/.config/awesome/theme/icons/app/anki.png"
theme.binclock_bgicon           	= "~/.config/awesome/theme/icons/app/transbinclock.png"
theme.task_icon                 	= "~/.config/awesome/theme/icons/app/task.png"
theme.task_done_icon            	= "~/.config/awesome/theme/icons/app/task_done.png"
theme.project_icon              	= "~/.config/awesome/theme/icons/app/project.png"
theme.udisks_glue               	= "~/.config/awesome/theme/icons/app/usb10.png"
theme.usb                       	= "~/.config/awesome/theme/icons/app/usb.png"
theme.calendar_icon             	= "~/.config/awesome/theme/icons/app/calendar4.png"
theme.cdrom                     	= "~/.config/awesome/theme/icons/app/disc.png"
theme.docsmenu_icon             	= "~/.config/awesome/theme/icons/app/docsmenu.png"
theme.xmind_icon                	= "~/.config/awesome/theme/icons/app/xmind.png"
theme.c_icon                    	= "~/.config/awesome/theme/icons/app/text-x-c.png"
theme.js_icon                   	= "~/.config/awesome/theme/icons/app/text-x-javascript.png"
theme.py_icon                   	= "~/.config/awesome/theme/icons/app/text-x-python.png"
theme.learning_icon             	= "~/.config/awesome/theme/icons/app/add.png"
theme.cpp_icon                  	= "~/.config/awesome/theme/icons/app/text-x-c++.png"
theme.markup_icon               	= "~/.config/awesome/theme/icons/app/text-xml.png"

--{{----------------------------------------------------------------------------

return theme
