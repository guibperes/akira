hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Internal keyboard
hl.device({
	name = "at-translated-set-2-keyboard",
	kb_layout = "br",
})

-- Internal touchpad
hl.device({
	name = "dell0c3e:00-27c6:0d43-touchpad",
	sensitivity = 0.3,
	natural_scroll = true,
})

hl.device({
	name = "dell-mouse",
	sensitivity = 0.5,
})

-- Internal monitor
hl.monitor({
	output = "desc:AU Optronics 0xED8F",
	mode = "1920x1080@120.21",
	position = "0x0",
	scale = 1,
})

--profile internal {
--  output $INTERNAL enable
--}
--profile docked {
--  output $LG enable
--  output $AOC enable
--  output $INTERNAL disable
--}
