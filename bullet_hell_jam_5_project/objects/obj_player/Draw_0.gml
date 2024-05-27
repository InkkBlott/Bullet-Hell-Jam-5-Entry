if (parry_window_counter > 0 or parry_invincibility % 4 >= 2) {
	SHADER_CONTROLLER.set_shader("color fill", [1, 1, 1, 1])
	draw_self()
	SHADER_CONTROLLER.reset_shader()
} 
else { draw_self() }