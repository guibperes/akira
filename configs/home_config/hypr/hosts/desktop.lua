local config = require("variables")

hl.on("hyprland.start", function()
	hl.exec_cmd(config.browser, { workspace = "1" })
	hl.exec_cmd("kitty eilmeldung", { workspace = "6" })
end)

hl.device({
	name = "logitech-g-pro--1",
	sensitivity = 0.5,
})

hl.device({
	name = "kingston-hyperx-alloy-fps-pro-mechanical-gaming-keyboard",
	kb_layout = "us",
	kb_variant = "intl",
})

hl.device({
	name = "kingston-hyperx-alloy-fps-pro-mechanical-gaming-keyboard-1",
	kb_layout = "us",
	kb_variant = "intl",
})

-- Workspace mapping
for i = 1, 5 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "desc:LG Electronics 27GN7 0x00008E27" })
end

for i = 6, 10 do
	local workspace = i % 10
	hl.workspace_rule({ workspace = tostring(workspace), monitor = "desc:AOC 2460G5 0x00000B61" })
end
