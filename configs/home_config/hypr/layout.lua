-- Akira アキラ — look and feel
-- configs/hypr/layout.lua
--
-- Static: Lua reads the palette at runtime, so nothing here is
-- generated. Only ~/.akira/theme/palette.lua comes from the template.

local akira = require("~/.akira/theme/palette.lua")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		col = {
			-- Gradient from the focus blue into magenta, matching the
			-- active-tab accent used across kitty and waybar.
			active_border = {
				colors = { akira.border_hi_a, akira.magenta_a },
				angle = 45,
			},
			inactive_border = akira.border_a,
		},
		resize_on_border = true,
		allow_tearing = false,
	},

	decoration = {
		rounding = 0,
		active_opacity = 1.0,
		inactive_opacity = 0.94,
		shadow = {
			enabled = true,
			range = 8,
			render_power = 2,
			color = akira.shadow_a,
		},
		blur = {
			enabled = true,
			size = 6,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		background_color = akira.bg,
		force_default_wallpaper = 0,
	},

	group = {
		col = {
			border_active = akira.border_hi_a,
			border_inactive = akira.border_a,
		},
		groupbar = {
			col = {
				active = akira.accent,
				inactive = akira.surface,
			},
			text_color = akira.fg,
			font_family = "JetBrainsMono Nerd Font",
		},
	},
})
