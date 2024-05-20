for (var i=0; i<array_length(boss_gauges); i++) {
	var gauge = boss_gauges[i]
	if (gauge.value <= 0) continue;
	gauge.anim_frame += gauge.value / 2
	gauge.anim_frame %= sprite_get_number(gauge.bar_sprite)
}