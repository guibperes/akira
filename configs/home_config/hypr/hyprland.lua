local host = require("host")

require("autostart")
require("env")
require("windowrules")
require("keybinds")
require("layout")
require("animations")
require("monitors")

-- Machine specific configuration
require("hosts." .. host.profile)
