local style = require("style")

hl.config({
  general = {
    gaps_in          = 10,
    gaps_out         = 10,

    border_size      = style.borderSize,

    col              = {
      active_border   = style.red,
      inactive_border = style.white,
    },

    resize_on_border = false,
    allow_tearing    = false,
    layout           = "dwindle",
  },

  decoration = {
    rounding         = 10,
    rounding_power   = 2,
    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow           = {
      enabled = false,
    },

    blur             = {
      enabled = false,

    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
  },

  master = {
    new_status = "master",
  },

  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo = true,
  },
})
