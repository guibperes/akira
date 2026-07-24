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
