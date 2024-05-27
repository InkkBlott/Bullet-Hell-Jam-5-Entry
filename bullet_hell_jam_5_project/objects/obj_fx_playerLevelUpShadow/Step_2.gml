event_inherited()

if (instance_exists(attached_instance)) {
	x = attached_instance.x
	y = attached_instance.y
	if (sprite_index != attached_instance.sprite_index) sprite_index = attached_instance.sprite_index
}

animation_counter += 0.01667
if (animation_counter > 1) { instance_destroy() }
else {
	image_xscale = 1.1 + animation_counter
	image_yscale = animcurve_channel_evaluate(animcurve_get_channel(acv_scale_bump, 0), animation_counter)
}