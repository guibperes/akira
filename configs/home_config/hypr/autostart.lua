local config = require("variables")

hl.on("hyprland.start", function()
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("waybar")
  hl.exec_cmd("kanshi")

  hl.exec_cmd(config.browser, { workspace = "1 silent" })
  hl.exec_cmd("kitty eilmeldung", { workspace = "6 silent" })
end)
