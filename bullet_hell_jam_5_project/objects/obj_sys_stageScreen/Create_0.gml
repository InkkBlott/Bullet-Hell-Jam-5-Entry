WORLD = id
depth = DEPTH_LEVEL.HUD

PLAYER.reset()

boss_gauges = []
for (var i=0; i<3; i++) {
	boss_gauges[i] = {
		value: 0,
		bg_x: room_width - ((sprite_get_width(spr_hud_bossGauge_bg)+2) * (i + 1)),
		bg_y: 2,
		bar_x: room_width - ((sprite_get_width(spr_hud_bossGauge_bg)+2) * (i + 1)) + 3,
		bar_y: 5,
		bar_sprite: spr_hud_bossGauge_bar1,
		anim_frame: 0,
	}
}
boss_gauges[1].bar_sprite = spr_hud_bossGauge_bar2
boss_gauges[2].bar_sprite = spr_hud_bossGauge_bar3

current_stage = undefined
current_stage_index = 0
stage_vars = {}
stage_complete = false
score_points = 0
scrolling_x = 0
scrolling_y = 0

pause_buffer = false

/// @function start_stage
start_stage = function() {
	stage_vars = {}
	current_stage_index = GAME.stage_index
	current_stage = GAME.stages[current_stage_index]
	instance_set_timeline(id, current_stage)
}
start_stage() //INITIALIZATION

/// @function next_stage
next_stage = function() {
	GAME.stage_index ++
	start_stage()
}

/// @function fill_gauge
fill_gauge = function(index, amount) {
	boss_gauges[index].value = clamp(boss_gauges[index].value + amount, 0, 1)
}

/// @function new_prop(x, y, sprite, [depth_level], [destroy_timer], [destroy_oob])
new_prop = function(_x, _y, sprite, depth_level = DEPTH_LEVEL.BACKGROUND, destroy_timer = undefined, destroy_oob = false) {
	var o = instance_create_depth(_x, _y, depth_level, obj_stageProp)
	o.sprite_index = sprite
	o.destroy_timer = destroy_timer
	o.destroy_out_of_bounds = destroy_oob
	return o
}

/// @function new_fx(x, y, obj, duration, [depth_level], [direction], [speed], [sprite], [blend_color], [attached_instance])
new_fx = function(_x, _y, obj, duration, depth_level=DEPTH_LEVEL.BACKGROUND, dir=undefined, spd=undefined, sprite=undefined, blend_color=undefined, attach=undefined) {
	var o = instance_create_depth(_x, _y, depth_level, obj)
	o.destroy_timer = duration
	if (dir) o.direction = dir
	if (spd) o.speed = spd
	if (sprite) o.sprite_index = sprite
	if (blend_color) o.image_blend = blend_color
	if (attach) o.attached_instance = attach
	return o
}

/// @function warningLine(x, y, direction, distance, duration, [density], [creator])
warningLine = function(_x, _y, _dir, _dist, _dur, _freq=25, _creator=noone) {
	var c = dcos(_dir)
	var s = -dsin(_dir)
	var ox, oy, in_frame
	var start_in_frame = point_in_rectangle(_x, _y, -10, -10, room_width+10, room_height+10)
	for (var i=0; i<=_dist; i+=_freq) {
		ox = _x+(i*c)
		oy = _y+(i*s)
		in_frame = point_in_rectangle(ox, oy, -10, -10, room_width+10, room_height+10)
		if (!in_frame) {
			if (start_in_frame) return; //if going from in-bounds to out-of-bounds, terminate line
			continue; //if out-of-bounds before and after iteration, just skip the effect creation and continue
		} else if (!start_in_frame) { start_in_frame = true } //if going from out-of-bounds to in-bounds, trigger "start in bounds" state
		new_fx(ox, oy, obj_fx_warning, _dur, DEPTH_LEVEL.WARNINGS).linked_instance = _creator
	}
}

/// @function warningZone(x1, y1, x2, duration, [density], [circular], [creator])
warningZone = function(_x1, _y1, _x2, _y2, _dur, _freq=25, _circle=false, _creator=noone) {
	if (_circle) var center_x = (_x2-_x1)/2, center_y = (_y2-_y1)/2, size = min(_x2-_x1, _y2-_y1)
	for (var _x=_x1; _x<=_x2; _x+=_freq) {
		for (var _y=_y1; _y<=_y2; _y+=_freq) {
			if (!point_in_rectangle(_x, _y, -10, -10, room_width+10, room_height+10)) continue;
			if (_circle and point_distance(center_x, center_y, _x, _y) > size) continue;
			new_fx(_x, _y, obj_fx_warning, _dur, DEPTH_LEVEL.WARNINGS).linked_instance = _creator
		}
	}
}

/// @function clearBullets([flash_effect], [origin_x], [origin_y])
clearBullets = function(flash=false, _x=undefined, _y=undefined) {
	if (flash) {
		with(WORLD.new_fx(0, 0, obj_effectAnim, 2, DEPTH_LEVEL.HUD,,, spr_shape_square_corner)) {
			image_xscale = room_width/10
			image_yscale = room_height/10
		}
	}
	var use_origin = (_x != undefined and _y != undefined) 
	with(obj_attack_enemy) {
		switch (object_index) {
			case obj_eAtk_ray_1:
				var c = dcos(image_angle), s = -dsin(image_angle)
				var px, py
				for (var i=0; i<ROOM_DIAGONAL; i+=40) {
					px = x + (i*c)
					py = y + (i*s)
					if (!point_in_rectangle(px, py, 0, 0, room_width-1, room_height-1)) break;
					WORLD.new_fx(px, py, obj_fx_bulletClear, 60, DEPTH_LEVEL.SMALL_ENEMY_EFFECTS, (use_origin) ? point_direction(_x, _y, x, y) : direction, (use_origin) ? 0.5+((point_distance(_x, _y, px, py)/room_height)*4) : speed)
				}
				break;
			default:
				WORLD.new_fx(x, y, obj_fx_bulletClear, 60, DEPTH_LEVEL.SMALL_ENEMY_EFFECTS, (use_origin) ? point_direction(_x, _y, x, y) : direction, (use_origin) ? 0.5+((point_distance(_x, _y, x, y)/room_height)*4) : speed)
				break;
		}
		instance_destroy()
	}
}