/// @description HUD

//focus mode
if (instance_exists(PLAYER_INSTANCE) and PLAYER_INSTANCE.focus_mode) {
	draw_sprite_stretched_ext(spr_shape_square_corner, 0, 0, 0, room_width, room_height, c_black, 0.2)
	with(obj_character) draw_mask()
	with(obj_attack_enemy) draw_mask()
}

//Player HP
for (var i=0; i<PLAYER.hp_max; i++) draw_sprite(spr_hud_playerHP, i<PLAYER.hp ? 0 : 1, i*sprite_get_width(spr_hud_playerHP), 0)

//Boss Gauges
for (var i=0; i<array_length(boss_gauges); i++) {
	var gauge = boss_gauges[i]
	draw_sprite(spr_hud_bossGauge_bg, 0, gauge.bg_x, gauge.bg_y)
	//draw_sprite(gauge.bar_sprite, floor(gauge.anim_frame), gauge.bar_x, gauge.bar_y)
	var cutoff = sprite_get_height(gauge.bar_sprite) * (1 - gauge.value)
	draw_sprite_part(gauge.bar_sprite, floor(gauge.anim_frame), 0, cutoff, sprite_get_width(gauge.bar_sprite), sprite_get_height(gauge.bar_sprite) - cutoff, gauge.bar_x, gauge.bar_y + cutoff)
}

//score
draw_text_scribble(room_width/2, 2, $"[fa_center][scale,0.8]Score: {score_points}")