// Inherit the parent event
event_inherited();

hp = 300
hp_max = 300
point_value = 10000
combat_active = false

normal_attacks = [
	tml_enemyAttack_bossNormal_1,
	//tml_enemyAttack_bossNormal_2,
	//tml_enemyAttack_bossNormal_3,
]
normal_attack_index = 0
attack_points = [
	[-32, -9], //0: left hand (OUR left)
	[28, -9], //1: right hand (OUR left)
	[-1, -8], //2: medallion
	[20, -65], //3: raised hand
	[0, 64], //4: shooting hand
]

attack = function(code=0) { //Override
	attack_ongoing = true
	attack_code = code
	if (code == 0) { //cycle throught normal attacks
		instance_set_timeline(id, normal_attacks[normal_attack_index])
		normal_attack_index ++
		normal_attack_index %= array_length(normal_attacks)
	}
}