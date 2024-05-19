/// @description HUD

//Player HP
for (var i=0; i<PLAYER.hp_max; i++) draw_sprite(spr_hud_playerHP, i<PLAYER.hp ? 0 : 1, i*25, 0)

//Boss Gauges
for (var i=0; i<3; i++) {
	var gauge = boss_gauges[i]
	draw_sprite(spr_hud_bossGauge_bg, 0, gauge.bg_x, gauge.bg_y)
	//draw_sprite(gauge.bar_sprite, floor(gauge.anim_frame), gauge.bar_x, gauge.bar_y)
	var cutoff = sprite_get_height(gauge.bar_sprite) * (1 - gauge.value)
	draw_sprite_part(gauge.bar_sprite, floor(gauge.anim_frame), 0, cutoff, sprite_get_width(gauge.bar_sprite), sprite_get_height(gauge.bar_sprite) - cutoff, gauge.bar_x, gauge.bar_y + cutoff)
}