// Inherit the parent event
event_inherited();

hp = 3
hp_max = 3
point_value = 100
action_queue_default = 0

eye_direction = 270

preset_attacks = [
	tml_eAtk_demon1_0,
	tml_eAtk_demon1_1,
]

preset_action_queues[0] = [ //pattern 1
	[CHARACTER_ACTION.MOVE_PATH, pth_intro_demon1_0, 90, acv_easeIn], //intro
	[CHARACTER_ACTION.WAIT, 30],
	[CHARACTER_ACTION.ATTACK, 0, false],
	[CHARACTER_ACTION.WAIT, 300], //attack for 5 seconds
	[CHARACTER_ACTION.STOP_ATTACK],
	[CHARACTER_ACTION.METHOD, function() { destroy_out_of_bounds = true }],
	[CHARACTER_ACTION.MOVE_PATH, PATHS.exit_down, 60, acv_rebound, 1, -20], //exit
	[CHARACTER_ACTION.ATTACK, 1, false], //exit attack
	[CHARACTER_ACTION.MOVE_PATH, PATHS.exit_down, 350, undefined, 1, room_height],
	[CHARACTER_ACTION.DESTROY],
]

