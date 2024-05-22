///@desc Initialization

PLAYER_INSTANCE = instance_create_depth(PLAYER.spawn_x, PLAYER.spawn_y, DEPTH_LEVEL.PLAYER_CHARACTER, PLAYER.object)

stage_vars.spawn_x = room_width/2
stage_vars.spawn_y = room_height/5 

new_prop(0, -sprite_get_height(spr_stage_backdrop)+360, spr_stage_backdrop, DEPTH_LEVEL.STAGE_BACKDROP).goTo(0, 0, 10800)