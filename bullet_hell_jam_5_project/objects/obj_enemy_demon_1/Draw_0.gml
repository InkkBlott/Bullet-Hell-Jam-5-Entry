//OVERRIDE (no inheritance)

if (damage_effect_timer > 0) {
	if (damage_effect_timer > 1) SHADER_CONTROLLER.set_shader("brightness contrast", 0.5, 0.5) else SHADER_CONTROLLER.set_shader("color invert")
	draw_self()
	draw_sprite_ext(spr_enemy_demon_1_eye, 0, x, y, 1, 1, eye_direction, c_white, 1)
	SHADER_CONTROLLER.reset_shader()
}
else {
	draw_self()
	draw_sprite_ext(spr_enemy_demon_1_eye, 0, x, y, 1, 1, eye_direction, c_white, 1)
}