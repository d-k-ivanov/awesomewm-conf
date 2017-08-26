--{{---| Mouse bindings |---------------------------------------------------------------------------------------------------
root.buttons(awful.util.table.join(
	awful.button({ },                 3,        function () mymainmenu:toggle()                         end)
--awful.button({ },                 4,        awful.tag.viewnext),
--awful.button({ },                 5,        awful.tag.viewprev)
))
--{{---| Key bindings |-----------------------------------------------------------------------------------------------------
globalkeys = awful.util.table.join(
	awful.key({ modkey,           },  key_F1,     hotkeys_popup.show_help,
		{description = "Show help",                             group = "Awesome"       }),
	awful.key({ modkey,           },  key_Left,   awful.tag.viewprev,
		{description = "View previous Tag",                     group = "Tag"           }),
	awful.key({ modkey,           },  key_Right,  awful.tag.viewnext,
		{description = "View next Tag",                         group = "Tag"           }),
	awful.key({ modkey,           },  key_Escape, awful.tag.history.restore,
		{description = "Go back",                               group = "Tag"           }),
	awful.key({ modkey,           },  key_j,      function () awful.client.focus.byidx( 1)                end,
		{description = "Focus next",                            group = "Client"        }),
	awful.key({ modkey,           },  key_k,      function () awful.client.focus.byidx(-1)                end,
		{description = "Focus previous",                        group = "Client"        }),
	awful.key({ modkey,           },  key_w,      function () mymainmenu:show()                           end,
		{description = "Show main menu",                        group = "Awesome"       }),
	awful.key({ modkey, "Shift"   },  key_j,      function () awful.client.swap.byidx(  1)                end,
		{description = "Swap with next client",                 group = "Client"        }),
	awful.key({ modkey, "Shift"   },  key_k,      function () awful.client.swap.byidx( -1)                end,
		{description = "Swap with previous client",             group = "Client"        }),
	awful.key({ modkey, "Control" },  key_j,      function () awful.screen.focus_relative( 1)             end,
		{description = "Focus the next screen",                 group = "Screen"        }),
	awful.key({ modkey, "Control" },  key_k,      function () awful.screen.focus_relative(-1)             end,
		{description = "Focus the previous screen",             group = "Screen"        }),
	awful.key({ modkey,           },  key_u,      awful.client.urgent.jumpto,
		{description = "Jump to urgent client",                 group = "Client"        }),
	awful.key({ modkey,           },  key_Tab,    awful.tag.viewnext,
		{description = "View next Tag",                         group = "Client"        }),
	awful.key({ altkey,           },  key_Tab,    awful.tag.viewprev,
		{description = "View previous Tag",                     group = "Client"        }),
	-- awful.key({ modkey,           },  key_Tab", function () awful.client.focus.history.previous()
	--                                               if client.focus then
	--                                                 client.focus:raise() end                            end,
	--                                             {description = "Go back",                               group = "Client"       }),

	--{{---| Hotkeys |----------------------------------------------------------------------------------------------------------

	--{{---| Terminal |---------------------------------------------------------------------------------------------------------
	awful.key({ modkey,           },  key_Return, function () awful.util.spawn(terminal)                  end,
		{description = "Run xTerm",                             group = "Terminals"     }),
	awful.key({ modkey, "Control" },  key_Return, function () awful.util.spawn(terminal2)                 end,
		{description = "Run Terminator",                        group = "Terminals"     }),

	--{{---| File managers |----------------------------------------------------------------------------------------------------
	awful.key({ modkey,           },  key_e,      function ()
		if fme_started then
			awful.util.spawn("pkill -f '" .. fme .. "'")
		else
			awful.util.spawn(fme)
		end
		fme_started = not fme_started                         end,
		{description = "Tougle SpaceFM",                        group = "File managers" }),
	awful.key({ modkey, "Shift"   },  key_s,      function () awful.util.spawn(fms)                       end,
		{description = "Run Gnome-Commander",                   group = "File managers" }),
	awful.key({ modkey,           },  key_s,      function () awful.util.spawn(fmd)                       end,
		{description = "Run Duble-Commander",                   group = "File managers" }),
	awful.key({ modkey,           },  key_x,      function ()
		if fmx_started then
			awful.util.spawn("pkill -f '" .. fmx .. "'")
		else
			awful.util.spawn(fmx)
		end
		fmx_started = not fmx_started                         end,
		{description = "Tougle PCmanFM",                        group = "File managers" }),

	--{{---| Standard |---------------------------------------------------------------------------------------------------------
	awful.key({ modkey, "Control" },  key_r,      awesome.restart,
		{ description= "Reload configuration",                  group = "Awesome"       }),
	awful.key({ modkey, "Shift"   },  key_q,      awesome.quit,
		{ description= "Exit from Awesome",                     group = "Awesome"       }),
	awful.key({ modkey,           },  key_l,      function () awful.tag.incmwfact( 0.05)                  end,
		{description = "Increase master width",                 group = "Layout"        }),
	awful.key({ modkey,           },  key_h,      function () awful.tag.incmwfact(-0.05)                  end,
		{description = "Decrease master width",                 group = "Layout"        }),
	awful.key({ modkey, "Shift"   },  key_h,      function () awful.tag.incnmaster( 1)                    end,
		{description = "Increase the number of master clients", group = "Layout"        }),
	awful.key({ modkey, "Shift"   },  key_l,      function () awful.tag.incnmaster(-1)                    end,
		{description = "Decrease the number of master clients", group = "Layout"        }),
	awful.key({ modkey, "Control" },  key_h,      function () awful.tag.incncol( 1)                       end,
		{description = "Increase the number of columns",        group = "Layout"        }),
	awful.key({ modkey, "Control" },  key_l,      function () awful.tag.incncol(-1)                       end,
		{description = "Decrease the number of columns",        group = "Layout"        }),
	awful.key({ modkey,           },  key_Space,  function () awful.layout.inc(layouts,  1)               end,
		{description = "Select next",                           group = "Layout"        }),
	awful.key({ modkey, "Shift"   },  key_Space,  function () awful.layout.inc(layouts, -1)               end,
		{description = "Select previous",                       group = "Layout"        }),
	awful.key({ modkey, "Control" },  key_n,      awful.client.restore,
		{description = "Restore minimized",                     group = "Client"        }),

	--{{---| Prompt |-----------------------------------------------------------------------------------------------------------
	awful.key({ modkey,           },  key_r,      function () mypromptbox[awful.screen.focused()]:run()   end,
		{description = "Run prompt",                            group = "Launcher"      }),
	awful.key({ modkey, "Shift"   },  key_r,      function () awful.util.spawn_with_shell("gmrun")        end,
		{description = "Run GTK prompt",                        group = "Launcher"      }),

	awful.key({ modkey, "Shift"   },  key_x,      function ()
		awful.prompt.run({ prompt = "Run Lua code: " },
			mypromptbox[mouse.screen].widget,
			awful.util.eval, nil,
			awful.util.getdir("cache") .. "/history_eval")          end,
		{description = "LUA execute prompt",                    group = "Launcher"      }),

	--{{---| Menubar |----------------------------------------------------------------------------------------------------------
	awful.key({ modkey,            },  key_p,     function() menubar.show()                               end,
		{description = "Show menu bar",                         group = "Launcher"      }),

	--{{---| Screenshot |-------------------------------------------------------------------------------------------------------
	awful.key({                    },  key_Print, function () awful.util.spawn("scrot -e 'mv $f ~/Documents/screenshots/ 2>/dev/null'") end,
		{description = "Take Screenshot",                       group = "Utilities"     }),

	--{{---| Lock Screen |------------------------------------------------------------------------------------------------------
	awful.key({ modkey,            }, key_z,      function () awful.util.spawn("xscreensaver-command -lock") end,
		{description = "Lock screen",                           group = "Utilities"     }),

	--{{---| arandr |-----------------------------------------------------------------------------------------------------------
	awful.key({ modkey,            }, key_Tilda,  function ()
		if arandr_started then
			awful.util.spawn("pkill -f 'arandr'")
		else
			awful.util.spawn("arandr")
		end
		arandr_started = not arandr_started                   end,
		{description = "run arandr",                            group = "Software"     }),

	--{{---| Virt-Manager |-----------------------------------------------------------------------------------------------------
	awful.key({ modkey,            }, key_v,      function () awful.util.spawn("sudo virt-manager")       end,
		{description = "run sudo virt-manager",                 group = "Software"     }),

	--{{---| Network Restart |-----------------------------------------------------------------------------------------------------
	awful.key({ modkey, "Shift"    }, key_n,      function () awful.util.spawn("sudo systemctl restart NetworkManager.service")         end,
		{description = "Restart Network Manager",                 group = "Software"     }),


	--{{---| Keyboard layout |--------------------------------------------------------------------------------------------------
	awful.key({ altkey,            },  key_Space, function() kbdcfg.switch()                              end,
		{description = "Change keyboard layout",                group = "Utilities"     })
--awful.key({ "Shift",           },  key_Ctrl_L,function() kbdcfg.switch()                              end,
--                                              {description = "Change keyboard layout",                group = "Utilities"     })
)

clientkeys = awful.util.table.join(
	awful.key({ modkey,           }, key_f,       function (c) c.fullscreen = not c.fullscreen            end,
		{description = "Toggle fullscreen",                     group = "Client"        }),
	awful.key({ modkey, "Shift"   }, key_c,       function (c) c:kill()                                   end,
		{description = "Close",                                 group = "Client"        }),
	awful.key({ modkey,           }, key_d,       function (c) c:kill()                                   end,
		{description = "Close",                                 group = "Client"        }),
	awful.key({ modkey, "Control" }, key_Space,   awful.client.floating.toggle,
		{description = "Toggle floating",                       group = "Client"        }),
	awful.key({ modkey, "Control" }, key_Return,  function (c) c:swap(awful.client.getmaster())           end,
		{description = "Move to master",                        group = "Client"        }),
	awful.key({ modkey,           }, key_q,       awful.client.movetoscreen,
		{description = "Move to screen",                        group = "Client"        }),
	awful.key({ modkey,           }, key_o,       awful.client.movetoscreen,
		{description = "Move to screen",                        group = "Client"        }),
	awful.key({ modkey,           }, key_t,       function (c) c.ontop = not c.ontop                      end,
		{description = "Toggle keep on top",                    group = "Client"        }),
	awful.key({ modkey,           }, key_n,       function (c) c.minimized = true                         end,
		{description = "Minimize",                              group = "Client"        }),
	awful.key({ modkey,           }, key_m,       function (c) c.maximized_horizontal = not c.maximized_horizontal
		c.maximized_vertical = not c.maximized_vertical         end,
		{description = "Maximize",                              group = "Client"        }),
	awful.key({ modkey, "Control" },  key_s,      function (c) c.sticky = not c.sticky                    end,
		{description = "Sticky window",                         group = "Layout"        })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = awful.util.table.join(globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9,         function () local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end                                                     end,
			{description = "View tag #"..i,                         group = "Tag" }),
		-- Toggle tag.
		awful.key({ modkey, "Control" }, "#" .. i + 9,
			function () local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end                                                     end,
			{description = "Toggle tag #" .. i,                     group = "Tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9,
			function () if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end end                                                 end,
			{description = "Move focused client to tag #"..i,       group = "Tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
			function () if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end end                                                 end,
			{description = "Toggle focused client on tag #" .. i,   group = "Tag" })
	)
end

clientbuttons = awful.util.table.join(
	awful.button({ },         1, function (c) client.focus = c; c:raise() end),
	awful.button({ modkey },  1, awful.mouse.client.move),
	awful.button({ modkey },  3, awful.mouse.client.resize))

--{{---| Set keys |---------------------------------------------------------------------------------------------------------
root.keys(globalkeys)
