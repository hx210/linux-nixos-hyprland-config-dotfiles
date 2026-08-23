-- Hyprland 0.55+ compositor configuration.
-- hypridle, hyprlock, and hyprpaper keep their own .conf files.

local colors = {
    base = "rgb(24273a)",
    surface0 = "rgb(363a4f)",
    surface1 = "rgb(494d64)",
    teal = "rgb(8bd5ca)",
}

local main_mod = "SUPER"

hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1.6 })
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto-up", scale = 1.6 })

for workspace = 1, 10 do
    hl.workspace_rule({ workspace = tostring(workspace), monitor = "eDP-1" })
end

for workspace = 11, 20 do
    hl.workspace_rule({ workspace = tostring(workspace), monitor = "HDMI-A-1" })
end

hl.on("hyprland.start", function()
    hl.exec_cmd("fish -c autostart")
end)

hl.env("HYPRCURSOR_THEME", "Catppuccin-Macchiato-Teal")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Catppuccin-Macchiato-Teal")
hl.env("XCURSOR_SIZE", "24")

hl.config({
    input = {
        kb_layout = "us,ua,ru",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:win_space_toggle",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
            tap_and_drag = true,
        },
    },
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = colors.teal,
            inactive_border = colors.surface1,
            nogroup_border_active = colors.teal,
            nogroup_border = colors.surface1,
        },
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        blur = {
            size = 8,
            passes = 2,
        },
        shadow = {
            enabled = true,
            range = 8,
            render_power = 3,
            offset = { 0, 0 },
            color = colors.teal,
            color_inactive = "rgb(24273a)",
        },
        active_opacity = 0.7,
        inactive_opacity = 0.7,
        fullscreen_opacity = 0.7,
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
        smart_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        background_color = colors.base,
    },
    binds = {
        workspace_back_and_forth = true,
    },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "default" })

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.device({ name = "epic mouse V1", sensitivity = -0.5 })

hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })

hl.window_rule({ match = { title = ".*mpv$" }, float = true })
hl.window_rule({ match = { title = ".*mpv$" }, opaque = true })
hl.window_rule({ match = { title = ".*mpv$" }, size = { "monitor_w * 0.5", "monitor_h * 0.5" } })
hl.window_rule({ match = { content = "video" }, float = true })
hl.window_rule({ match = { content = "video" }, opaque = true })
hl.window_rule({ match = { content = "video" }, size = { "monitor_w * 0.5", "monitor_h * 0.5" } })

hl.window_rule({ match = { title = ".*imv.*" }, float = true })
hl.window_rule({ match = { title = ".*imv.*" }, opaque = true })
hl.window_rule({ match = { title = ".*imv.*" }, size = { "monitor_w * 0.7", "monitor_h * 0.7" } })
hl.window_rule({ match = { content = "photo" }, float = true })
hl.window_rule({ match = { content = "photo" }, opaque = true })
hl.window_rule({ match = { content = "photo" }, size = { "monitor_w * 0.7", "monitor_h * 0.7" } })

hl.window_rule({ match = { title = ".*\\.pdf$" }, float = true })
hl.window_rule({ match = { title = ".*\\.pdf$" }, opaque = true })
hl.window_rule({ match = { title = ".*\\.pdf$" }, maximize = true })
hl.window_rule({ match = { title = ".*YouTube - Brave$" }, opaque = true })
hl.window_rule({ match = { title = ".*ComfyUI - Brave$" }, opaque = true })
-- hl.window_rule({ match = { title = ".*Slack$" }, opaque = true })

hl.window_rule({ match = { title = "swappy" }, opaque = true })
hl.window_rule({ match = { title = "swappy" }, center = true })
hl.window_rule({ match = { title = "swappy" }, stay_focused = true })
hl.window_rule({ match = { class = "^terminal-dropterm$" }, float = true })
hl.window_rule({ match = { class = "^terminal-dropterm$" }, pin = true })
hl.window_rule({ match = { class = "^org.pulseaudio.pavucontrol$" }, float = true })
hl.window_rule({ match = { class = "^org.pulseaudio.pavucontrol$" }, pin = true })

hl.bind(main_mod .. " + ALT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(main_mod .. " + ALT + M", hl.dsp.submap("move"))
hl.define_submap("move", function()
    hl.bind("right", hl.dsp.window.move({ direction = "r" }))
    hl.bind("left", hl.dsp.window.move({ direction = "l" }))
    hl.bind("up", hl.dsp.window.move({ direction = "u" }))
    hl.bind("down", hl.dsp.window.move({ direction = "d" }))
    hl.bind("l", hl.dsp.window.move({ direction = "r" }))
    hl.bind("h", hl.dsp.window.move({ direction = "l" }))
    hl.bind("k", hl.dsp.window.move({ direction = "u" }))
    hl.bind("j", hl.dsp.window.move({ direction = "d" }))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(main_mod .. " + CTRL + T", hl.dsp.exec_cmd("pypr toggle term"))
hl.bind(main_mod .. " + CTRL + V", hl.dsp.exec_cmd("pypr toggle volume"))
hl.bind(main_mod .. " + CTRL + M", hl.dsp.workspace.toggle_special("minimized"))
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd("pypr toggle_special minimized"))
hl.bind(main_mod .. " + CTRL + E", hl.dsp.exec_cmd("pypr expose"))
hl.bind(main_mod .. " + Z", hl.dsp.exec_cmd("pypr zoom"))

hl.bind(main_mod .. " + T", hl.dsp.exec_cmd("fish -c kitty_launch"))
hl.bind(main_mod .. " + SHIFT + T", hl.dsp.exec_cmd("Telegram"))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd("qutebrowser"))
hl.bind(main_mod .. " + SHIFT + B", hl.dsp.exec_cmd("brave"))
hl.bind(main_mod .. " + F", hl.dsp.exec_cmd("thunar"))
hl.bind(main_mod .. " + S", hl.dsp.exec_cmd("spotify"))
hl.bind(main_mod .. " + Y", hl.dsp.exec_cmd("pear-desktop"))
hl.bind(main_mod .. " + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(main_mod .. " + SHIFT + D", hl.dsp.exec_cmd("firejail --apparmor discord"))
hl.bind(main_mod .. " + ESCAPE", hl.dsp.exec_cmd("fish -c wlogout_uniqe"))
hl.bind(main_mod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(main_mod .. " + SHIFT + S", hl.dsp.exec_cmd("fish -c screenshot_to_clipboard"))
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd("fish -c screenshot_edit"))
hl.bind(main_mod .. " + SHIFT + R", hl.dsp.exec_cmd("fish -c record_screen_gif"))
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd("fish -c record_screen_mp4"))
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd("fish -c clipboard_to_type"))
hl.bind(main_mod .. " + SHIFT + V", hl.dsp.exec_cmd("fish -c clipboard_to_wlcopy"))
hl.bind(main_mod .. " + X", hl.dsp.exec_cmd("fish -c clipboard_delete_item"))
hl.bind(main_mod .. " + SHIFT + X", hl.dsp.exec_cmd("fish -c clipboard_clear"))
hl.bind(main_mod .. " + U", hl.dsp.exec_cmd("fish -c bookmark_to_type"))
hl.bind(main_mod .. " + SHIFT + U", hl.dsp.exec_cmd("fish -c bookmark_add"))
hl.bind(main_mod .. " + CTRL + U", hl.dsp.exec_cmd("fish -c bookmark_delete"))
hl.bind(main_mod .. " + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(main_mod .. " + SHIFT + C", hl.dsp.exec_cmd("pypr menu 'Color picker'"))
hl.bind(main_mod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(main_mod .. " + SHIFT + F", hl.dsp.window.float())
hl.bind(main_mod .. " + CTRL + F", hl.dsp.window.fullscreen())
hl.bind(main_mod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + SHIFT + O", hl.dsp.layout("togglesplit"))

hl.bind(main_mod .. " + SHIFT + A", hl.dsp.exec_cmd("fish -c airplane_mode_toggle"))
hl.bind(main_mod .. " + SHIFT + N", hl.dsp.exec_cmd("dunstctl set-paused toggle"))
hl.bind(main_mod .. " + SHIFT + Y", hl.dsp.exec_cmd("fish -c bluetooth_toggle"))
hl.bind(main_mod .. " + SHIFT + W", hl.dsp.exec_cmd("fish -c wifi_toggle"))

hl.bind(main_mod .. " + p", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(main_mod .. " + bracketright", hl.dsp.exec_cmd("playerctl next"))
hl.bind(main_mod .. " + bracketleft", hl.dsp.exec_cmd("playerctl previous"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("volumectl -u up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("volumectl -u down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("volumectl toggle-mute"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("volumectl -m toggle-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("lightctl -D intel_backlight up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("lightctl -D intel_backlight down"))

hl.bind(main_mod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(main_mod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(main_mod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(main_mod .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "d" }))
hl.bind(main_mod .. " + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

for workspace = 1, 10 do
    local key = tostring(workspace % 10)
    hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

for workspace = 11, 20 do
    local key = tostring(workspace % 10)
    hl.bind(main_mod .. " + ALT + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(main_mod .. " + ALT + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
