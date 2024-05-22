var o
for (var ang=0; ang<360; ang+=15) {
	o = shoot(obj_eAtk_bullet_5, ang, 0, attack_points[0][0], attack_points[0][1])
	o.hspeed = dcos(ang)*4
	o.vspeed = dsin(ang)
	o.direction -= 45
	o.vspeed += 1
	o = shoot(obj_eAtk_bullet_5, ang, 0, attack_points[1][0], attack_points[1][1])
	o.hspeed = dcos(ang)*4
	o.vspeed = dsin(ang)
	o.direction += 45
	o.vspeed += 1
}