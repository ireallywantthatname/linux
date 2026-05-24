-- ~/.config/hypr/binds.lua
-- Keybindings, Mouse Bindings, and Dynamic Scratchpad Actions

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "hyprlauncher"
local browser     = "helium-browser"


----------------------------
---- KEYBOARD BINDINGS -----
----------------------------

local mainMod = "ALT"

-- Basic session management and applications
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { locked = true, repeating = true })
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen())
hl.bind("SUPER + P", hl.dsp.window.pin())

-- System power/lock binds
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("hyprshutdown -t 'Rebooting...' --post-cmd 'systemctl reboot'"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprshutdown -t 'Shutting down...' --post-cmd '~/.config/hypr/scripts/shutdown'"))

-- Screenshot & utility binds
hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshots.sh"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/ocr.sh"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("~/.local/bin/voice-typer"))

-- Media control binds
hl.bind("Pause", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl --player=spotify previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl --player=spotify next"))

-- Screen/touch control binds
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("hyprctl dispatch dpms toggle"))
hl.bind("SUPER + XF86PowerOff", hl.dsp.exec_cmd("hyprctl keyword input:touchdevice:enabled true"))
hl.bind("SUPER + SHIFT + XF86PowerOff", hl.dsp.exec_cmd("hyprctl keyword input:touchdevice:enabled false"))
hl.bind(mainMod .. " + XF86PowerOff", hl.dsp.exec_cmd("adb shell input keyevent 26"))

-- Layout, Steam, Whatsapp, Bluetooth, and browser binds
hl.bind("SUPER + G", hl.dsp.layout("swapnext"), { locked = true, repeating = true })
hl.bind("SUPER + SHIFT + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/steam"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/bluetooth"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("[workspace 5] " .. browser .. ' --profile-directory="Default" --app=https://web.whatsapp.com'))

hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu  | cliphist decode | wl-copy"))
hl.bind("SUPER + O", hl.dsp.exec_cmd('echo -e "spreadsheets\\npresentation\\nforms\\ndocument" | fuzzel --dmenu | xargs -I{} ' .. browser .. ' --profile-directory="Default" --app=https://docs.google.com/{}/ &> /dev/null &'))
hl.bind("SUPER + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/work --list"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("brave"))
hl.bind("SUPER + W", hl.dsp.exec_cmd(browser .. ' --profile-directory="Default"'))

-- Move focus with mainMod + arrow keys (hjkl)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }), { repeating = true })
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }), { repeating = true })
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }), { repeating = true })
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }), { repeating = true })

-- Resizing active window
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })

-- Dynamic loop for switching workspaces and moving windows (1-10)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Mouse scrolling through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Interactive mouse window moving and resizing
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Cycle between current and previous workspace
hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "previous" }))

-- Laptop volume and LCD brightness control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume --inc"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume --dec"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume --toggle-mic"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume --toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/backlight --inc"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/backlight --dec"), { locked = true, repeating = true })

-- Monitor relative workspace movements
hl.bind("CTRL + " .. mainMod .. " + SHIFT + K", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind("CTRL + " .. mainMod .. " + SHIFT + J", hl.dsp.workspace.move({ monitor = "d" }))


-----------------------------------------
---- IN-MEMORY DYNAMIC SCRATCHPADS -----
-----------------------------------------

-- Reusable Lua scratchpad toggle function
local function toggle_scratchpad(name, cmd, match_class)
    return function()
        local windows = hl.get_windows()
        local found = false
        for _, w in ipairs(windows) do
            if w.class == match_class and w.workspace and w.workspace.name == "special:" .. name then
                found = true
                break
            end
        end
        if not found then
            -- Run the app inside the special workspace cleanly
            hl.dispatch(hl.dsp.exec_cmd("[workspace special:" .. name .. "] " .. cmd))
        else
            -- Toggle special workspace visibility
            hl.dispatch(hl.dsp.workspace.toggle_special(name))
        end
    end
end

-- Keybindings for the dynamic in-memory scratchpads:
-- SUPER + RETURN: Toggles SSH terminal scratchpad using Kitty
hl.bind("SUPER + RETURN", toggle_scratchpad("ssh", "kitty --class scratchpad_ssh", "scratchpad_ssh"))

-- ALT + S: Toggles dynamic System Monitor utility using Kitty + btop
hl.bind(mainMod .. " + S", toggle_scratchpad("magic", "kitty --class scratchpad_monitor -e btop", "scratchpad_monitor"))

-- ALT + SHIFT + S: Manually move active window into the magic special workspace
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
