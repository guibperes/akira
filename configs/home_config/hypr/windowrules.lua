-- Windows and Workspaces
-- Ignore maximize requests from apps
hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
  name = "fix-xwayland-drags",
  no_focus = true,
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false
  },
})

-- Steam windowrule for games
hl.window_rule({
  name = "content-game",
  fullscreen = true,
  immediate = true,
  match = {
    class = "^(steam_app_\\d+)|gamescope$",
    title = "negative:|^(?i)(.*(Launcher|NetEase Game Security).*)$",
  },
})
