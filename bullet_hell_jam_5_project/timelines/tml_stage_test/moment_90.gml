var o = instance_create_depth(stage_vars.spawn_x+25, stage_vars.spawn_y, DEPTH_LEVEL.SMALL_ENEMIES, obj_enemy)
o.action_queue_default = STOCK_ACTION_QUEUES.test
array_push(stage_vars.enemies, o)