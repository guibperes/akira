local config = require("variables")

-- Keybinds
hl.bind(config.mainMod .. "+ Q", hl.dsp.window.close())

hl.bind(config.mainMod .. "+ T", hl.dsp.exec_cmd(config.terminal))
hl.bind(config.mainMod .. "+ F", hl.dsp.exec_cmd(config.fileManager))
hl.bind(config.mainMod .. "+ B", hl.dsp.exec_cmd(config.browser))
hl.bind(config.mainMod .. "+ SPACE", hl.dsp.exec_cmd(config.menu))
hl.bind(config.mainMod .. "+ ESCAPE", hl.dsp.exec_cmd("hyprlock"))
hl.bind(config.mainMod .. "+ SHIFT + P", hl.dsp.exec_cmd("akira-system-menu"))

hl.bind(config.mainMod .. "+ C", hl.dsp.window.float({ action = "toggle" }))

-- Move focus with mainMod + arrow keys
hl.bind(config.mainMod .. "+ left", hl.dsp.focus({ direction = "left" }))
hl.bind(config.mainMod .. "+ right", hl.dsp.focus({ direction = "right" }))
hl.bind(config.mainMod .. "+ up", hl.dsp.focus({ direction = "up" }))
hl.bind(config.mainMod .. "+ down", hl.dsp.focus({ direction = "down" }))

-- Move focus in Vim style
hl.bind(config.mainMod .. "+ H", hl.dsp.focus({ direction = "left" }))
hl.bind(config.mainMod .. "+ L", hl.dsp.focus({ direction = "right" }))
hl.bind(config.mainMod .. "+ K", hl.dsp.focus({ direction = "up" }))
hl.bind(config.mainMod .. "+ J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind(config.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(config.mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("akira-audio volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("akira-audio volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("akira-audio volume-toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("akira-audio mic-toggle"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("akira-audio play-next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("akira-audio play-prev"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("akira-audio play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("akira-audio play-pause"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("akira-brightness up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("akira-brightness down"), { locked = true, repeating = true })

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("akira-screenshot area"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("akira-screenshot window"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("akira-screenshot monitor"))

-- Screenrecord
hl.bind(config.mainMod .. " + Print", hl.dsp.exec_cmd("akira-screenrecord record"))
hl.bind(config.mainMod .. " + CTRL + Print", hl.dsp.exec_cmd("akira-screenrecord stop"))

-- Emoji picker
hl.bind(config.mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd("wofi-emoji"))
