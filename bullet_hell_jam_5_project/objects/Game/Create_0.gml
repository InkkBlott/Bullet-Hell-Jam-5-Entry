randomize()

window_set_size(room_width*SETTINGS.window_scale, room_height*SETTINGS.window_scale)
window_position_reset()
depth = DEPTH_LEVEL.HUD

global.game = id
#macro GAME global.game

player = {
	object: obj_player,
	instance: noone,
	hp: 3,
	hp_max: 3,
	spawn_x: room_width/2,
	spawn_y: room_height*2/3,
	levels: [
		{ // level 0 (starting)
			score_requirement: 0,
			attack_timeline: tml_playerAttack_default_01,
		},
		{ // level 1
			score_requirement: 100,
			attack_timeline: tml_playerAttack_default_02,
		},
		{ // level 2
			score_requirement: 200,
			attack_timeline: tml_playerAttack_default_03,
		},
	],
	
	/// @function reset()
	reset: function() {
		hp = hp_max
	}
}
#macro PLAYER global.game.player
#macro PLAYER_INSTANCE global.game.player.instance

stages = [
	//tml_stage_test
	tml_stage_main, //0
]
stage_index = 0
stage_instance = noone //obj_sys_stageScreen instance
#macro WORLD global.game.stage_instance

hitstop = 0
paused = false
__pause_instance_deactivation = false
pause_backdrop = undefined //sprite from application surface on pause
pause_event = undefined //PAUSE_EVENT code
pause_text = scribble("PAUSED").blend(c_aqua, 1).scale(3).align(fa_center, fa_middle)
/// @function toggle_pause([pause_event])
toggle_pause = function(ev = undefined) {
	paused = !paused
	if (paused) {
		pause_event = ev
		if (pause_event == PAUSE_EVENT.PLAYER_PAUSE) {
			surface_set_target(application_surface)
			pause_text.draw(room_width/2, room_height/2)
			surface_reset_target()
		}
		else if (pause_event == PAUSE_EVENT.HITSTOP_MINOR) {
			hitstop = 5
		}
		else if (pause_event == PAUSE_EVENT.HITSTOP_MAJOR) {
			hitstop = 20
		}
		pause_backdrop = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0)
		__pause_instance_deactivation = true
	} else {
		instance_activate_all()
		if (sprite_exists(pause_backdrop)) sprite_delete(pause_backdrop)
	}
}