if (damage_effect_timer > 0) {
	if (damage_effect_timer > 1) SHADER_CONTROLLER.set_shader("brightness contrast", 0.5, 0.5) else SHADER_CONTROLLER.set_shader("color invert")
	draw_self()
	SHADER_CONTROLLER.reset_shader()
}
else draw_self()