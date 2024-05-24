var d = (instance_exists(PLAYER_INSTANCE) ? point_direction(x+attack_points[0][0], y+attack_points[0][1], PLAYER_INSTANCE.x, PLAYER_INSTANCE.y) : 270)
var p = 0 //hand 1
shoot(obj_eAtk_bullet_1, d, 2, attack_points[p][0], attack_points[p][1])
shoot(obj_eAtk_bullet_1, d-15, 1.5, attack_points[p][0], attack_points[p][1])
shoot(obj_eAtk_bullet_1, d+15, 1.5, attack_points[p][0], attack_points[p][1])
shoot(obj_eAtk_bullet_1, d-30, 1.25, attack_points[p][0], attack_points[p][1])
shoot(obj_eAtk_bullet_1, d+30, 1.25, attack_points[p][0], attack_points[p][1])
shoot(obj_eAtk_bullet_1, d-45, 1, attack_points[p][0], attack_points[p][1])
shoot(obj_eAtk_bullet_1, d+45, 1, attack_points[p][0], attack_points[p][1])