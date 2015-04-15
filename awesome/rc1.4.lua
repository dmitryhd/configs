-- Dmitryhd config for awesome 3.4

-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
require("wicked")
require("vicious")
-- Load Debian menu entries
require("debian.menu")


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/dimert/.config/awesome/themes/zenburn-wp/theme.lua")

terminal = "terminator"
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.max,
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
  -- Each screen has its own tag table.
  --  tags[s] = awful.tag({ 'browser', 'vim', 'console', 'files', 'other01', 'other02' }, s, layouts[2])
  tags[s] = awful.tag({ 'browser', 'work', 'work', 'files', 'files', 
                        'mus' }, s,
                      { layouts[3], layouts[2], layouts[2], layouts[2],
                        layouts[2], layouts[1] })
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
}
vncmenu = {
   { "Server", 'bash -c "echo 111111 | vncviewer -autopass dim-work-server::5900"' },
   { "Win2012", 'bash -c "echo 111111 | vncviewer -autopass 10.0.0.36::5900"' },
}
home_dir = '/home/dimert/'
awesome_dir = '/home/dimert/.config/awesome/'
iconpath = awesome_dir .. 'themes/zenburn-wp/icons/'
wallpaper_path = home_dir .. 'wallpapers/abstract/'
-- current_wp = wallpaper_path .. 'dark_aurora-wide.jpg'
current_wp = wallpaper_path .. 'sci_fi-wallpaper-1920x1080.jpg'
gvim_icon = iconpath .. 'vim-2.png'
folder_icon = iconpath .. 'folder-close-icon.png'
chrome_icon = iconpath .. 'chrome.png'
logoff_icon = iconpath .. 'logoff.png'
reboot_icon = iconpath .. 'reboot.png'
suspend_icon = iconpath .. 'suspend.png'
shutdown_icon = iconpath .. 'shutdown.png'
terminal_icon = iconpath .. 'terminal.png'
wallpaper_icon = iconpath .. 'wp.png'

reboot_command = 'sudo reboot'
shutdown_command = 'sudo shutdown -h now'
suspend_command = '/usr/bin/dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend'
set_random_wp_command = 'feh --bg-scale --randomize ' .. wallpaper_path
set_specific_wp = 'feh --bg-scale ' .. current_wp

mymainmenu = awful.menu({ items = { { "chrome", 'google-chrome', chrome_icon },
                                    { "firefox", 'firefox'},
                                    { "MusicPlayer", "banshee"},
                                    { "screenshot", "shutter"},
                                    { "mysqlworkbench", "mysql-workbench"},
                                    { "Control Center", "gnome-control-center"},
                                    { "gVim", 'gvim', gvim_icon },
                                    { "FileManager", 'thunar', folder_icon},
                                    { "random-wp", set_random_wp_command, wallpaper_icon },
                                    { "specific-wp", set_specific_wp, wallpaper_icon },
                                    { "VNC", vncmenu },
                                    { "-------------", nil},
                                    { "Restart WM", awesome.restart, beautiful.awesome_icon },
                                    { "Logout", awesome.quit, logoff_icon },
                                    { "Reboot", reboot_command, reboot_icon },
                                    { "Suspend", suspend_command, suspend_icon},
                                    { "Shutdown", shutdown_command, shutdown_icon },
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })
-- Create a systray
mysystray = widget({ type = "systray" })
-- --------------------------------------------------------
-- --------------------------------------------------------
-- KEYBOARD LAYOUT
-- Keyboard map indicator and changer
  kbdcfg = {}
  kbdcfg.cmd = "setxkbmap"
  kbdcfg.layout = { "us", "ru" }
  kbdcfg.current = 1  -- us is our default layout
  kbdcfg.widget = widget({ type = "textbox", align = "right" })
  kbdcfg.widget.text = " " .. kbdcfg.layout[kbdcfg.current] .. " "
  kbdcfg.switch = function ()
     kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
     local t = " " .. kbdcfg.layout[kbdcfg.current] .. " "
     kbdcfg.widget.text = t
     os.execute( kbdcfg.cmd .. t )
  end
  
  -- Mouse bindings
  kbdcfg.widget:buttons(awful.util.table.join(
      awful.button({ }, 1, function () kbdcfg.switch() end)
  ))
-- --------------------------------------------------------

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
        kbdcfg.widget,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ 'Mod1', 'Control' }, "Left",   awful.tag.viewprev       ),
    awful.key({ 'Mod1', 'Control' }, "Down",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ 'Mod1', 'Control' }, "Right",  awful.tag.viewnext       ),
    awful.key({ 'Mod1', 'Control' }, "Up",     awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),
    
    -- Alt + Right Shift switches the current keyboard layout
    awful.key({ 'Mod1' }, "Shift_L", function () kbdcfg.switch() end),
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey,           }, "v",  function () awful.util.spawn_with_shell("gvim") end),
    awful.key({ modkey,           }, "e",  function () awful.util.spawn_with_shell("thunar") end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
--    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
--    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1)
                                              naughty.notify({ title = 'Layout', text = awful.layout.getname(), timeout = 3 }) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1)
                                              naughty.notify({ title = 'Layout', text = awful.layout.getname(), timeout = 3 }) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    --{ rule = { class = "Google-chrome" },
    --  properties = { tag = tags[1][1] } },
    { rule = { class = "Gvim" },
      properties = { tag = tags[1][2] } },
    --{ rule = { class = "Terminator" },
    --  properties = { tag = tags[1][3] } },
}
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)


client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
--awful.util.spawn_with_shell("setxkbmap -layout 'us,ru' -variant ',winkeys,winkeys' -option grp:alt_shift_toggle -option grp_led:caps -option terminate:ctrl_alt_bksp")
awful.util.spawn_with_shell("run-once.sh nm-applet")
awful.util.spawn_with_shell("run-once.sh google-chrome")
awful.util.spawn_with_shell("run-once.sh gvim")
awful.util.spawn_with_shell("run-once.sh thunar --daemon")
awful.util.spawn_with_shell("run-once.sh conky")
awful.util.spawn_with_shell("xdg-mime default Thunar.desktop inode/directory")
awful.util.spawn_with_shell("gnome-settings-daemon")
awful.util.spawn_with_shell(set_specific_wp)
-- awful.util.spawn_with_shell("terminator")
