-- ~/.config/hypr/look.lua
-- Monitors, Layouts, Input Devices, and Aesthetic Styling

local theme = require("theme")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "eDP-1",
    mode     = "2256x1504@60.00",
    position = "0x0",
    scale    = 1.566667
})

hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@60.00000",
    position = "0x-1080",
    scale    = 1.25
})


------------------
---- XWAYLAND ----
------------------

hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in             = 4,
        gaps_out            = 8,
        border_size         = 0, -- Sleek, thin border when multiple windows are open
        col = {
            inactive_border = "0x00000000", -- Fully invisible to prevent visual clutter
            active_border   = theme.lavender, -- Premium Catppuccin accent
        },
        resize_on_border    = false,
        allow_tearing       = true,
        layout              = "dwindle"
    },

    decoration = {
        rounding     = 0,
        dim_inactive = true,
        dim_strength = 0.2,
        dim_special  = 0,
        blur = {
            enabled = false
        }
    },

    dwindle = {
        preserve_split = true
    },

    master = {
        new_status = "master"
    },

    misc = {
        disable_hyprland_logo   = true,
        font_family             = "FiraCode Nerd Font",
        splash_font_family      = "FiraCode Nerd Font",
        force_default_wallpaper = 1,
        vrr                     = 1
    },

    input = {
        kb_layout      = "us",
        follow_mouse   = 1,
        sensitivity    = 0.3,
        focus_on_close = 1,
        touchpad = {
            natural_scroll          = true,
            middle_button_emulation = true
        },
        touchdevice = {
            enabled = true
        }
    },

    gestures = {
        workspace_swipe_touch = true
    },

    binds = {
        allow_workspace_cycles = true,
        workspace_center_on    = 1
    },

    cursor = {
        zoom_factor = 1
    }
})


----------------------------
---- PER-DEVICE SETTINGS ---
----------------------------

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5
})


------------------
---- GESTURES ----
------------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "down", action = "close" })


--------------------
---- ANIMATIONS ----
--------------------

-- Snappy, physics-based Bezier curve (completes in ~120ms with smooth deceleration)
hl.curve("snap", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.0} } })

hl.config({
    animations = {
        enabled = false,
    }
})

hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, bezier = "snap", style = "slide" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.5, bezier = "snap", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.5, bezier = "snap" })
