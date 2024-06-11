///@desc << STAGE START >>

stage_vars.backdrop.goTo(0, 0, 600)

var o = instance_create_depth(stage_vars.spawn_x, stage_vars.spawn_y, DEPTH_LEVEL.SMALL_ENEMIES, obj_enemy)
//o.action_queue_default = STOCK_ACTION_QUEUES.test
o.set_action_queue(STOCK_ACTION_QUEUES.test)
array_push(stage_vars.enemies, o)