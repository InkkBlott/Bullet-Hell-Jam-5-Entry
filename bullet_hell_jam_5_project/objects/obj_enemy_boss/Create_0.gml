// Inherit the parent event
event_inherited();

hp = 1000
hp_max = 1000
point_value = 10000
action_queue_default = 0

preset_attacks = [
	tml_eAtk_bossNormal_1,
	tml_eAtk_bossNormal_2,
	tml_eAtk_bossNormal_3,
]
attack_points = [
	[-32, -9], //0: left hand (OUR left)
	[28, -9], //1: right hand (OUR left)
	[-1, -8], //2: medallion
	[20, -65], //3: raised hand
	[0, 64], //4: shooting hand
]
preset_action_queues[0] = [
	[CHARACTER_ACTION.WAIT, 90],
	[CHARACTER_ACTION.ATTACK, undefined, true],
	[CHARACTER_ACTION.WAIT, 30],
	[CHARACTER_ACTION.MOVE_PATH, PATHS.circle_small, 120, acv_bounce],
	[CHARACTER_ACTION.METHOD, function(){WORLD.clearBullets(false,x,y)}],
	[CHARACTER_ACTION.WAIT, 120],
	[CHARACTER_ACTION.ATTACK, undefined, true],
	[CHARACTER_ACTION.MOVE_PATH, PATHS.circle_small_ccw, 120, acv_incline],
	[CHARACTER_ACTION.METHOD, function(){WORLD.clearBullets(false,x,y)}],
]