if (attack_variables[0] == 0) {
	shoot(obj_eAtk_enemyBullet_TEST, 270, 2.5, 10, 0, true)
	shoot(obj_eAtk_enemyBullet_TEST, 270-25, 1.5, 10, 0, true)
	shoot(obj_eAtk_enemyBullet_TEST, 270+25, 1.5, 10, 0, true)
}
else if (attack_variables[0] == 1) {
	shoot(obj_eAtk_bullet_4, 270, 4, 10, 0, true)
}
else if (attack_variables[0] == 2) {
	for (var ang=0; ang<360; ang+=45) {
		shoot(obj_eAtk_bullet_2, ang, 2, 10, 0, true)
		shoot(obj_eAtk_bullet_2, ang, 2, 10, 0, true).rotation_sign = -1
	}
}
else if (attack_variables[0] == 3) {
	shoot(obj_eAtk_fireball, 270, 2, 10, 0, true)
	shoot(obj_eAtk_fireball, 270-45, 2, 10, 0, true)
	shoot(obj_eAtk_fireball, 270+45, 2, 10, 0, true)
}
else if (attack_variables[0] == 4) {
	shoot(obj_eAtk_lightning, 270, 2, 10, 0, true)
	shoot(obj_eAtk_lightning, 270-30, 2, 10, 0, true)
	shoot(obj_eAtk_lightning, 270+30, 2, 10, 0, true)
}

attack_ongoing = false