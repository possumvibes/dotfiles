-- the requires are overkill but i'll remove what i'm not using at the end

local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local keys = {}
local modkey = "Mod4"

local tagcount = 9
keys.tagcount = tagcount

-- Gui:           Focus, Flags, System Launch
-- Gui+Shift:     Move, !Flags
-- Gui+Alt:       Layout management
-- Gui+Alt+Shift: !Layout management
-- Gui+Control:   Awesome System; Screen I Guess

keys.globalkeys = gears.table.join(
    -- Awesome Control: Gui+Control
    awful.key({ modkey, "Control" }, "s", hotkeys_popup.show_help,
        {description="show help", group="awesome"} ),

    awful.key({ modkey, "Control" }, "w", function () mymainmenu:show() end,
        {description = "show main menu", group = "awesome"} ),

    awful.key({ modkey, "Control" }, "r", awesome.restart,
        {description = "reload awesome", group = "awesome"} ),

    awful.key({ modkey, "Control" }, "q", awesome.quit,
        {description = "quit awesome", group = "awesome"} ),


    -- Focus Clients: Gui
    -- By direction
    awful.key({modkey }, "n",
        function () awful.client.focus.bydirection("left") end,
        {description = "focus left", group = "client"} ),

    awful.key({modkey }, "e",
        function () awful.client.focus.bydirection("down") end,
        {description = "focus down", group = "client"} ),

    awful.key({modkey }, "u",
        function () awful.client.focus.bydirection("up") end,
        {description = "focus up", group = "client"} ),

    awful.key({modkey }, "a",
        function () awful.client.focus.bydirection("right") end,
        {description = "focus right", group = "client"} ),

    -- by index
    awful.key({ modkey }, "j",
        function () awful.client.focus.byidx( 1) end,
        {description = "focus next by index", group = "client"} ),

    awful.key({ modkey }, "i",
        function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"} ),

    -- by something else
    awful.key({ modkey, }, "g", awful.client.urgent.jumpto,
        {description = "jump to urgent client", group = "client"} ),

    awful.key({ modkey, }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Focus Tags: Gui: Gui
    awful.key({ modkey }, "Left", awful.tag.viewprev,
        {description = "view previous", group = "tag"} ),

    awful.key({ modkey }, "Right", awful.tag.viewnext,
        {description = "view next", group = "tag"} ),

    awful.key({ modkey }, "Escape", awful.tag.history.restore,
        {description = "go back", group = "tag"} ),

    -- Focus Screens: Gui+Control
    -- awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
    --           {description = "focus the next screen", group = "screen"}),
    -- awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
    --           {description = "focus the previous screen", group = "screen"}),
    -- Standard program


    -- Move Clients: Gui+Shift
    awful.key({modkey, "Shift"}, "n", function () awful.client.swap.bydirection("left") end,
        {description = "swap with next client left", group = "client"} ),

    awful.key({modkey, "Shift"}, "e",
        function () awful.client.swap.bydirection("down") end,
        {description = "swap with next client down", group = "client"} ),

    awful.key({modkey, "Shift"}, "u",
        function () awful.client.swap.bydirection("up") end,
        {description = "swap with next client up", group = "client"} ),

    awful.key({modkey, "Shift"}, "a",
        function () awful.client.swap.bydirection("right") end,
        {description = "swap with next client right", group = "client"} ),

    awful.key({ modkey, "Shift"   }, "j",
        function () awful.client.swap.byidx(  1)    end,
        {description = "swap with next client by index", group = "client"} ),

    awful.key({ modkey, "Shift"   }, "k",
        function () awful.client.swap.byidx( -1)    end,
        {description = "swap with previous client by index", group = "client"} ),



    -- Layout/display: Gui+Alt for next/increase; Gui+Alt+Shift for prev/decrease
    awful.key({ modkey, "Mod1" }, "f", function () awful.tag.incmwfact( 0.05) end,
        {description = "increase main client width factor", group = "layout"} ),

    awful.key({ modkey, "Mod1", "Shift"}, "f", function () awful.tag.incmwfact(-0.05) end,
        {description = "decrease main client width factor", group = "layout"} ),


    awful.key({ modkey, "Mod1" }, "c",
        function () awful.tag.incnmaster( 1, nil, true) end,
        {description = "increase the number of main clients", group = "layout"} ),

    awful.key({ modkey, "Mod1", "Shift" }, "c",
        function () awful.tag.incnmaster(-1, nil, true) end,
        {description = "decrease the number of main clients", group = "layout"} ),


    awful.key({ modkey, "Mod1" }, "l",
        function () awful.tag.incncol( 1, nil, true) end,
        {description = "increase the number of columns", group = "layout"} ),

    awful.key({ modkey, "Mod1", "Shift" }, "l",
        function () awful.tag.incncol(-1, nil, true) end,
        {description = "decrease the number of columns", group = "layout"} ),


    awful.key({ modkey, "Mod1", }, "space",
        function () awful.layout.inc( 1) end,
        {description = "select next layout", group = "layout"} ),

    awful.key({ modkey, "Mod1", "Shift" }, "space",
        function () awful.layout.inc(-1) end,
        {description = "select previous layout", group = "layout"} ),



    -- (global) Flags: Gui; Gui+Shift to invert
    awful.key({ modkey, "Shift" }, "z",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- System launch: Gui
    -- Prompts and pickers
    awful.key({ modkey }, "p",
        function() awful.spawn.with_shell("rofi -show combi -combi-modes 'window,drun,run'") end,
        {description = "launch rofi application picker", group = "launcher"} ),

    -- temp: G-space as backup picker
    awful.key({ modkey }, "space",
        function() awful.spawn.with_shell("rofi -show combi -combi-modes 'window,drun,run'") end,
        {description = "launch rofi application picker", group = "launcher"} ),

    awful.key({ modkey, "Shift" }, "r",
        function () awful.screen.focused().mypromptbox:run() end,
        {description = "run prompt", group = "launcher"} ),

    awful.key({ modkey }, "x",
        function ()
          awful.prompt.run {
            prompt       = "Run Lua code: ",
            textbox      = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. "/history_eval"
          }
        end,
        {description = "lua execute prompt", group = "awesome"} ),


    -- Terminal
    awful.key({ modkey, }, "Return", function () awful.spawn(terminal) end,
        {description = "open a terminal", group = "launcher"}),


    -- Launch: Control+Alt
    awful.key( {"Control", "Mod1"}, "d", function () awful.spawn("thunar") end,
        {description = "launch thunar", group = "programs"}),

    awful.key( {"Control", "Mod1"}, "h", function () awful.spawn("firefox") end,
        {description = "launch firefox", group = "programs"}),

    awful.key( {"Control", "Mod1"}, "k", function () awful.spawn("keepassxc") end,
        {description = "launch keepassxc", group = "programs"}),

    awful.key( {"Control", "Mod1"}, "l", function () awful.spawn.with_shell("xset s activate") end,
        {description = "lock screen", group = "programs"})

)

for i = 1, tagcount do
    keys.globalkeys = gears.table.join(keys.globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + tagcount,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),

        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + tagcount,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),

        -- -- Toggle tag display (for screen).
        -- awful.key({ modkey, "Control", "Shift" }, "#" .. i + tagcount,
        --           function ()
        --               local screen = awful.screen.focused()
        --               local tag = screen.tags[i]
        --               if tag then
        --                  awful.tag.viewtoggle(tag)
        --               end
        --           end,
        --           {description = "toggle tag #" .. i, group = "tag"})

        -- Toggle tag on focused client.
        awful.key({ modkey, "Control" }, "#" .. i + tagcount,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

keys.clientkeys = gears.table.join(
    -- Focus Except It's Actually Client Management: Gui
    awful.key({ modkey }, "w",      function (c) c:kill() end,
        {description = "close", group = "client"}
    ),

    -- Move
    awful.key({ modkey, "Shift" }, "m", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    --

    -- Screen: Gui+Control
    -- awful.key({ modkey, "Control" }, "o", function (c) c:move_to_screen() end,
    --           {description = "move to screen", group = "client"}),

    -- Flags: Gui (high priority)
    awful.key({ modkey, }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),

    -- (un-minimize is a global bind)
    awful.key({ modkey, }, "z", function (c) c.minimized = true end,
        {description = "minimize", group = "client"}),

    awful.key({ modkey, }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),


    -- Flags: Gui+Shift (Inverse and lower priority)
    awful.key({ modkey, "Shift" }, "f",  awful.client.floating.toggle,
         {description = "toggle floating", group = "client"}
    ),

    awful.key({ modkey, "Shift" }, "t", function (c) c.ontop = not c.ontop end,
              {description = "toggle keep on top", group = "client"}),

    -- Layout: Fancy Maximizes Can Use Alt, Thanks
    awful.key({ modkey, "Mod1" }, "v",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Mod1" }, "h",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)


keys.clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

root.keys(keys.globalkeys)

return keys