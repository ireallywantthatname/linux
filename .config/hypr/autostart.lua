-- ~/.config/hypr/autostart.lua
-- Environment Variables and Daemon Startup Configuration

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function ()
    hl.exec_cmd("fnott")
    hl.exec_cmd("nm-applet")
    -- hl.exec_cmd("swaybg -i ~/Downloads/wallpaper.jpeg -m fit")
    -- hl.exec_cmd("swaybg -i ~/Downloads/IMG_3175.jpg -m fit")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("/home/irwtn/.local/bin/ironbar")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    
    hl.exec_cmd("bash ~/.config/hypr/scripts/startup")
    hl.exec_cmd("thunar --daemon")
    -- hl.exec_cmd("extramaus")
    
    hl.exec_cmd("bash ~/.config/hypr/scripts/battery-low")
    hl.exec_cmd("bash ~/.config/hypr/scripts/battery-status")
    hl.exec_cmd("hyprlauncher -d")
    hl.exec_cmd("hyprsunset")
    
    -- hl.exec_cmd("hypridle")
end)
