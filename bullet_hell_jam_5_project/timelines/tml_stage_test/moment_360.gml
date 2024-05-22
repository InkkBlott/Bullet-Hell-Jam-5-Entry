///@desc <<!!!>> Boss <<!!!>>

//clear enemies
for (var i=0; i<array_length(stage_vars.enemies); i++) {
	var o = stage_vars.enemies[i]
	if (!instance_exists(o)) continue;
	WORLD.new_fx(o.x, o.y, obj_effectAnim, 10, DEPTH_LEVEL.FOREGROUND,,, spr_fx_flash_big)
	instance_destroy(o)
}

//spawn boss
instance_create_depth(room_width/2, room_height/6, DEPTH_LEVEL.BIG_ENEMIES, obj_enemy_boss).action_queue_default = STOCK_ACTION_QUEUES.boss_test