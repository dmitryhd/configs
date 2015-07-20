-- Dmitryhd config for awesome 3.5

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
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
    awesome.connect_signal("debug::error", function (err)
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
beautiful.init("/usr/share/awesome/themes/default/theme.lua")
-- beautiful.init("/home/dimert/.config/awesome/themes/zenburn-wp/theme.lua")

terminal = "terminator"
editor = os.getenv("vim") or "vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.max,
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}
--
layout = {}
layout.float = awful.layout.suit.floating
layout.tile = awful.layout.suit.tile
layout.max = awful.layout.suit.max

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tag_layout = {layout.max, layout.tile, layout.float, layout.tile, layout.float, layout.float}
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ 'browser', 'work', 'work', 'files', 'other', 'mus'}, s, tag_layout)
end
-- }}}


awesome_dir = '/home/dimert/.config/awesome/'
iconpath = awesome_dir .. 'themes/zenburn-wp/icons/'
wallpaper_path = '/home/dimert/wallpapers/'
gvim_icon = iconpath .. 'vim-2.png'
folder_icon = iconpath .. 'folder-close-icon.png'
chrome_icon = iconpath .. 'chrome.png'
logoff_icon = iconpath .. 'logoff.png'
reboot_icon = iconpath .. 'reboot.png'
suspend_icon = iconpath .. 'suspend.png'
shutdown_icon = iconpath .. 'shutdown.png'
terminal_icon = iconpath .. 'terminal.png'
wallpaper_icon = iconpath .. 'wp.png'

filemanager = 'nautilus --no-desktop'
reboot_command = 'shutdown -r now'
shutdown_command = 'shutdown -h now'
suspend_command = 'sudo pm-suspend'
set_random_wp_command = 'feh --bg-scale --randomize ' .. wallpaper_path

other_programs = {
    { "random-wp", set_random_wp_command, wallpaper_icon},
    { "GnomeCP", "gnome-control-center"},
    { "Rhythmbox", 'rhythmbox'},
    { "Terminator", terminal},
}

-- lfs = require"lfs"
themes_dir = awesome_dir .. 'themes/'

function isdir(fn)
    return (lfs.attributes(fn,"mode") == "directory")
end

-- Return list of number, directory name 
function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('ls -a "'..directory..'"'):lines() do
        if isdir(directory .. filename) and filename ~= '..' and filename ~= '.' then
            i = i + 1
            t[i] = filename
        end
    end
    return t
end

-- Return list of files, directory name 
function ls(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('ls -a "'..directory..'"'):lines() do
        if filename ~= '..' and filename ~= '.' then
            i = i + 1
            t[i] = filename
        end
    end
    return t
end


-- themes_menu = {}
-- themes = scandir(themes_dir)
-- for i, theme in pairs( themes )
-- do
--     themes_menu[i] = {theme, function () beautiful.init(themes_dir .. theme .. '/theme.lua') end}
-- end
-- 
-- wp_menu = {}
-- wps = ls(wallpaper_path)
-- for i, wp in pairs( wps )
-- do
--     wp_menu[i] = {wp, 'feh --bg-scale ' .. wallpaper_path .. wp}
-- end




mymainmenu = awful.menu({ items = { { "Chrome", 'google-chrome', chrome_icon},
                                    { "Firefox", 'firefox', beautiful.awesome_icon},
                                    { "Vim", 'gvim', gvim_icon},
                                    { "FileManager", filemanager, folder_icon},
                                    { "Others", other_programs, beautiful.awesome_icon},
--                                    { 'themes', themes_menu},
                                    { 'wallpapers', wp_menu},
                                    { '-----------------', nil},
                                    { "Restart WM", awesome.restart, reboot_icon},
                                    { "Quit", awesome.quit, logoff_icon}, 
                                    { "Reboot", reboot_command, reboot_icon},
                                    { "Suspend", suspend_command, suspend_icon},
                                    { "Shutdown", shutdown_command, shutdown_icon},
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- --------------------------------------------------------
-- KEYBOARD LAYOUT
-- Keyboard map indicator and changer
  keyboardwidget = wibox.widget.textbox()
  kbdcfg = {}
  kbdcfg.cmd = "setxkbmap"
  kbdcfg.layout = { "us", "ru" }
  kbdcfg.current = 1  -- us is our default layout
  keyboardwidget:set_markup(" | <b><big>us</big></b> ")
  kbdcfg.switch = function ()
     kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
     local t = " " .. kbdcfg.layout[kbdcfg.current] .. " "
     os.execute( kbdcfg.cmd .. t )
     keyboardwidget:set_markup(" | <b><big>" .. t .. "</big></b> ")
  end
  
-- --------------------------------------------------------
-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- CPU and Memory widget
cpuwidget = wibox.widget.textbox()
cpuwidget:set_markup(" | <tt>Cpu: <b><big>0</big></b></tt>%")    
separatorwidget = wibox.widget.textbox()
separatorwidget:set_text("|")
statwidgettimer = timer({ timeout = 5 })    
memwidget = wibox.widget.textbox()
memwidget:set_markup(" | Memory: <b><big>0</big></b>%")
statwidgettimer:connect_signal("timeout",    
  function()    
     fh = assert(io.popen("top -bn 2 -d 0.01 | grep '^%Cpu' | tail -n 1 | gawk '{printf \"%3.0f\", $2+$4+$6}'", "r"))    
     cpuwidget:set_markup("<tt> | Cpu: <b>" .. fh:read("*l") .. "</b>%</tt>")    
     fh:close()    
     fh = assert(io.popen("free | grep Mem | gawk '{printf \"%3.0f\", $3/$2 * 100.0}'", "r"))    
     memwidget:set_markup("<tt> | Memory: <b>" .. fh:read("*l") .. "</b>%</tt>")    
     fh:close()    
  end    
)    
statwidgettimer:start()

-- Battery widget
batterywidget = wibox.widget.textbox()
batterywidget:set_text("")
batterywidget:set_text(" | Battery ")    
batterywidgettimer = timer({ timeout = 5 })    
batterywidgettimer:connect_signal("timeout",    
  function()    
    -- fh = assert(io.popen("acpi | cut -d, -f 2,3 -", "r"))    
    -- batterywidget:set_text(" |" .. fh:read("*l") .. " | ")    
    -- fh:close()    
  end    
)    
batterywidgettimer:start()

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
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
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
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(cpuwidget)
    right_layout:add(memwidget)
    right_layout:add(batterywidget)
    right_layout:add(keyboardwidget)
    right_layout:add(separatorwidget)
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
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
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ 'Mod1', 'Control' }, "Left",   awful.tag.viewprev       ),
    awful.key({ 'Mod1', 'Control' }, "Down",   awful.tag.viewprev       ),
    awful.key({ 'Mod1', 'Control' }, "Right",  awful.tag.viewnext       ),
    awful.key({ 'Mod1', 'Control' }, "Up",     awful.tag.viewnext       ),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ 'Mod1',           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

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
    awful.key({ modkey,           }, "v", function () awful.util.spawn('gvim') end),
    awful.key({ modkey,           }, "c", function () awful.util.spawn('google-chrome') end),
    awful.key({ modkey,           }, "e", function () awful.util.spawn(filemanager) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
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

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.movetotag(tag)
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.toggletag(tag)
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
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
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

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

function run_once(prg, arg_string, pname, screen)
    if not prg then
        do return nil end
    end

    if not pname then
       pname = prg
    end

    if not arg_string then 
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. ")",screen)
    else
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. " ".. arg_string .."' || (" .. prg .. " " .. arg_string .. ")",screen)
    end
end

--run_once("google-chrome", nil, nil, 1)
--run_once(terminal, nil, nil, 3)
--run_once("gvim", nil, nil, 3)
--run_once("conky", nil, nil)
--run_once("nm-applet", nil, nil, 3)

-- awful.util.spawn_with_shell("run-once.sh nm-applet")
-- awful.util.spawn_with_shell("run-once.sh conky")
awful.util.spawn_with_shell(set_random_wp_command)
awful.util.spawn_with_shell("run-once.sh nm-applet")
awful.util.spawn_with_shell("run-once.sh conky")
awful.util.spawn_with_shell("gnome-settings-daemon")
-- }}}
