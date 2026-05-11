-- Autostart
exec = hl.dsp.exec_cmd
hl.on("hyprland.start", function () 
  hl.exec_cmd("ambxst")
end)
-- Monitors 
hl.monitor(
  {
    output = "DP-3",
    mode="preferred",
    position="0x0",
    scale="1"
  }
)
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
-- Variables

-- Ambxst keybinds 
hl.bind("SUPER + SPACE", exec("ambxst run launcher"))
hl.bind("SUPER + A", exec("ambxst run assistant"))

-- Keybinds
mainMod = "SUPER"
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER+T", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER+Z", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER+Return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + E", exec("nautilus"))
--- Move Focus 
---- Arrows 

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
---- Nvim 

hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
--- Workspaces
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
  hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

--- Switch workspaces with arrows
hl.bind(mainMod .. " + CTRL + LEFT", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + RIGHT",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + J",   hl.dsp.focus({ workspace = "e-1" }))

---- Media Keys

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
-- Animation curves
hl.curve("linear", {type = "bezier", points = {{0, 0}, {1, 1}}})
hl.curve("md3_standard", {type = "bezier", points = {{0.2, 0}, {0, 1}}})
hl.curve("md3_decel", {type = "bezier", points = {{0.05, 0.7}, {0.1, 1}}})
hl.curve("md3_accel", {type = "bezier", points = {{0.3, 0}, {0.8, 0.15}}})
hl.curve("overshot", {type = "bezier", points = {{0.05, 0.9}, {0.1, 1.1}}})
hl.curve("crazyshot", {type = "bezier", points = {{0.1, 1.5}, {0.76, 0.92}}})
hl.curve("hyprnostretch", {type = "bezier", points = {{0.05, 0.9}, {0.1, 1.0}}})
hl.curve("menu_decel", {type = "bezier", points = {{0.1, 1}, {0, 1}}})
hl.curve("menu_accel", {type = "bezier", points = {{0.38, 0.04}, {1, 0.07}}})
hl.curve("easeInOutCirc", {type = "bezier", points = {{0.85, 0}, {0.15, 1}}})
hl.curve("easeOutCirc", {type = "bezier", points = {{0, 0.55}, {0.45, 1}}})
hl.curve("easeOutExpo", {type = "bezier", points = {{0.16, 1}, {0.3, 1}}})
hl.curve("softAcDecel", {type = "bezier", points = {{0.26, 0.26}, {0.15, 1}}})
hl.curve("md2", {type = "bezier", points = {{0.4, 0}, {0.2, 1}}})


-- Animation configs
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3,
    bezier = "md3_decel",
    style = "popin 60%"
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3,
    bezier = "md3_decel",
    style = "slide"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "linear",
    style = "slide"
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "md3_decel"
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 3,
    bezier = "menu_decel",
    style = "slide"
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.6,
    bezier = "menu_accel"
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 2,
    bezier = "menu_decel"
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 4.5,
    bezier = "menu_accel"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 7,
    bezier = "menu_decel",
    style = "slide"
})

hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 3,
    bezier = "md3_decel",
    style = "slidevert"
})

-- Window rules 
hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
