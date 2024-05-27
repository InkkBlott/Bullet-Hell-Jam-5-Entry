///@desc shoot
var even_shot = ((attack_variables[0] / attack_variables[1]) % 2 == 0)
shoot(obj_eAtk_bullet_3, attack_variables[0] - 12, (even_shot) ? 0.7 : 1, attack_points[0][0], attack_points[0][1]).spin_speed *= (even_shot) ? 1 : -1.35
shoot(obj_eAtk_bullet_3, attack_variables[0] + 12, (even_shot) ? 0.7 : 1, attack_points[1][0], attack_points[1][1]).spin_speed *= (even_shot) ? 1 : -1.35
attack_variables[0] += attack_variables[1]