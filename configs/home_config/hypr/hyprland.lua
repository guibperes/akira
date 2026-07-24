local host = require("host")

require("autostart")
require("env")
require("windowrules")
require("keybinds")
require("layout")
require("animations")

-- Machine specific configuration
require("hosts." .. host.profile)

-- Monitors managed by kanshi
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
