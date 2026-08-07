local mainMod = "SUPER"

-- Window
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + X", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- layout
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- mouse support
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- screenshot
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp -d)\" - | wl-copy"), { locked = true, non_consuming = true })
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grim -g \"$(slurp -d)\" - | wl-copy"), { locked = true, non_consuming = true }) -- todo: fullscreen screenshot

-- Workspace
for i = 1, 10 do
    local index = i % 10
    hl.bind(mainMod .. " + " .. index, hl.dsp.focus({ workspace = index }))
    hl.bind(mainMod .. " + SHIFT + " .. index, hl.dsp.window.move({ workspace = index }))
end

for i = 1, 4 do
    local bind = { mainMod .. " + mouse_up", mainMod .. " + mouse_down" }
    local keycombo = { bind[1], bind[2], "CTRL + " .. bind[1], "CTRL + " .. bind[2] }
    local prefix = { "+", "-", "r+", "r-" }
    hl.bind(keycombo[i], hl.dsp.focus({ workspace = prefix[i] .. "1" }))
end

-- System State
-- hl.bind(mainMod .. " + SHIFT + Q", lock)
-- multimedia
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Applications
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(launcher .. " --show drun"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))

-- Resizing
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    local bindings = {
        { "right", 10,  0 },
        { "left",  -10, 0 },
        { "up",    0,   10 },
        { "down",  0,   -10 },

        { "l",     10,  0 },
        { "h",     -10, 0 },
        { "k",     0,   10 },
        { "j",     0,   -10 },
    }

    for _, binding in ipairs(bindings) do
        hl.bind(
            binding[1],
            hl.dsp.window.resize({
                x = binding[2],
                y = binding[3],
                relative = true,
            }),
            { repeating = true }
        )
    end

    hl.bind("escape", hl.dsp.submap("reset"))
end)
