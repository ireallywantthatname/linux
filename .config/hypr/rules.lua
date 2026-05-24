-- ~/.config/hypr/rules.lua
-- Window Rules and Workspace Rules

----------------------
---- WINDOW RULES ----
----------------------

-- Suppress maximize events globally
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Legacy commented-out window rules translated to the new Lua syntax:
-- -- hl.window_rule({ match = { class = "code" }, workspace = 1 })
-- -- hl.window_rule({ match = { class = "dev.zed.Zed" }, workspace = 1 })
-- -- hl.window_rule({ match = { class = "jetbrains-idea-ce" }, workspace = 1 })
-- -- hl.window_rule({ match = { class = "jetbrains-webstorm" }, workspace = 1 })
-- -- hl.window_rule({ match = { class = "cursor" }, workspace = 1 })
-- -- hl.window_rule({ match = { class = "Emulator" }, workspace = 1 })
-- -- hl.window_rule({ match = { class = "mpv" }, workspace = 2 })
-- 
-- -- hl.window_rule({ match = { class = "xfce-polkit" }, float = true })
-- -- hl.window_rule({ match = { class = "nwg-look" }, float = true })
-- -- hl.window_rule({ match = { class = "timeshift-gtk" }, float = true })
-- -- hl.window_rule({ match = { class = "cheese" }, float = true })
-- -- hl.window_rule({ match = { class = "org.gnome.DiskUtility" }, float = true })
-- -- hl.window_rule({ match = { class = "org.pwmt.zathura" }, float = true })
-- -- hl.window_rule({ match = { class = "org.raspberrypi.rpi-imager" }, float = true })
-- -- hl.window_rule({ match = { class = "com.network.manager" }, float = true })
-- -- hl.window_rule({ match = { class = "com.saivert.pwvucontrol" }, float = true })
-- -- hl.window_rule({ match = { class = "Emulator" }, float = true })
-- 
-- -- hl.window_rule({ match = { class = "mpv" }, fullscreen = true })
-- 
-- -- hl.window_rule({ match = { class = "org.nomacs.ImageLounge" }, float = true })
-- -- hl.window_rule({ match = { class = "org.nomacs.ImageLounge" }, size = { 1000, 800 } })
-- 
-- -- hl.window_rule({ match = { class = "blueman-manager" }, float = true })


-------------------------
---- WORKSPACE RULES ----
-------------------------

-- SMART GAPS: No gaps when only one visible tiled window is present
-- "w[tv1]" matches workspace containing exactly 1 visible tiled window
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })

-- SMART BORDERS: No borders when only one visible tiled window is present
hl.window_rule({
    match = { float = false, workspace = "w[tv1]" },
    border_size = 0
})
