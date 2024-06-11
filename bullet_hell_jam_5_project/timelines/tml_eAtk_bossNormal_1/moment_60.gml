var o
for (var ang=0; ang<360; ang+=15) {
	o = shoot(obj_eAtk_bullet_5,,, attack_points[0][0], attack_points[0][1])
	o.hspeed = dcos(ang)*2
	o.vspeed = dsin(ang)*0.5
	o.direction -= 45
	o.vspeed += 1
	o = shoot(obj_eAtk_bullet_5,,, attack_points[1][0], attack_points[1][1])
	o.hspeed = dcos(ang+7.5)*2
	o.vspeed = dsin(ang+7.5)*0.5
	o.direction += 45
	o.vspeed += 1
}