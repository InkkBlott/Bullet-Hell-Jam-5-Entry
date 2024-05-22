WORLD = id
depth = DEPTH_LEVEL.HUD

PLAYER.reset()

boss_gauges = []
//[DEV] Minimized mechanic for the jam!
//for (var i=0; i<3; i++) {
//	boss_gauges[i] = {
//		value: 0,
//		bg_x: room_width - ((sprite_get_width(spr_hud_bossGauge_bg)+2) * (i + 1)),
//		bg_y: 2,
//		bar_x: room_width - ((sprite_get_width(spr_hud_bossGauge_bg)+2) * (i + 1)) + 3,
//		bar_y: 5,
//		bar_sprite: spr_hud_bossGauge_bar1,
//		anim_frame: 0,
//	}
//}
//boss_gauges[1].bar_sprite = spr_hud_bossGauge_bar2
//boss_gauges[2].bar_sprite = spr_hud_bossGauge_bar3
boss_gauges[0] = {
	value: 0.5,
	bg_x: room_width - sprite_get_width(spr_hud_bossGauge_bg) - 2,
	bg_y: 2,
	bar_x: room_width - sprite_get_width(spr_hud_bossGauge_bg) + 1,
	bar_y: 5,
	bar_sprite: spr_hud_bossGauge_bar1,
	anim_frame: 0,
}

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

/// @function new_fx(x, y, obj, duration, [depth_level], [direction], [speed], [sprite], [blend_color])
new_fx = function(_x, _y, obj, duration, depth_level=DEPTH_LEVEL.BACKGROUND, dir=undefined, spd=undefined, sprite=undefined, blend_color=undefined) {
	var o = instance_create_depth(_x, _y, depth_level, obj)
	o.destroy_timer = duration
	if (dir) o.direction = dir
	if (spd) o.speed = spd
	if (sprite) o.sprite_index = sprite
	if (blend_color) o.image_blend = blend_color
	return o
}