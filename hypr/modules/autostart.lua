-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
-- --
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
	hl.exec_cmd("hypridle")
	-- hl.exec_cmd(terminal)
	-- hl.exec_cmd("nm-applet")
	hl.exec_cmd("waybar")
	hl.exec_cmd("batsignal -w 20 -c 10")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("swayosd-server")
	hl.exec_cmd("swaync")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	-- hl.exec_cmd("dunst")
	hl.exec_cmd("swaync-client --subscribe-waybar")
	-- hl.exec_cmd('')
	hl.exec_cmd("nm-applet --indicator &")
	-- hl.exec_cmd(
	-- 	'mpvpaper -vs -o "loop" eDP-1 /home/mich/Pictures/anime-girl-sword-blue-eyes-live-wallpaper-wallsflow-com.mp4'
	-- )
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
