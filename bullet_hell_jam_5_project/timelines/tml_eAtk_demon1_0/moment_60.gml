var d = (instance_exists(PLAYER_INSTANCE)) ? point_direction(x, y, PLAYER_INSTANCE.x, PLAYER_INSTANCE.y) : eye_direction
shoot(obj_eAtk_bullet_1, d-15, 2)
shoot(obj_eAtk_bullet_1, d+15, 2)