///@desc Attack End
attack_ongoing = false

instance_create_depth(x-8, y-5, DEPTH_LEVEL.PLAYER_ATTACKS, obj_pAtk_playerBullet_TEST)
instance_create_depth(x+8, y-5, DEPTH_LEVEL.PLAYER_ATTACKS, obj_pAtk_playerBullet_TEST)