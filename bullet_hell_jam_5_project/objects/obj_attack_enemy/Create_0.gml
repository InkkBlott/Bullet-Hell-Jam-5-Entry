depth = DEPTH_LEVEL.ENEMY_ATTACKS

attack_active = true
destroy_on_hit = false
destroy_out_of_bounds = false
out_of_bounds_buffer = 0
destroy_timer = undefined //(number)
scroll_with_stage = false
scroll_factor = 1
player_hit = false //for use in destroy event
parried = false
advanced_collision_detection = true
__collision_size = 2
__collision_size_init_sentinel = undefined

/// @function warp(x, y)
// moves instance while also changing it's "previous" x/y values to avoid unwanted collision detection
warp = function(_x, _y) {
	x = _x
	y = _y
	xprevious = _x
	yprevious = _y
}

/// @function collision_check(target)
collision_check = function(_target) { //[DEV] TODO
	if (instance_place(x, y, _target)) return true
	if (advanced_collision_detection) {
		var size = __collision_size * min(image_xscale, image_yscale)
		var dist = point_distance(x, y, xprevious, yprevious)
		if (size >= dist) return false //cancel if there's no point in doing the loop
		var ang = point_direction(x, y, xprevious, yprevious)
		for (var pos=size; pos<dist; pos+=size) {
			if instance_place(x+(dcos(ang)*pos), y-(dsin(ang)*pos), _target) return true
		}
	}
	return false
}

/// @function hit_player
hit_player = function() {
	//escape on invalid target
	if (!instance_exists(PLAYER_INSTANCE)) return;
	//inflict damage
	PLAYER_INSTANCE.damage()
	player_hit = true
	//destroy on hit
	if (destroy_on_hit) instance_destroy()
}

/// @function draw_mask
draw_mask = function() {
	switch(sprite_index) {
		//rotating rectangle masks
		case spr_atk_bullet_4:
		case spr_atk_lightning:
			draw_sprite_ext(spr_shape_square_center, 0, x, y, (sprite_get_bbox_right(sprite_index)-sprite_get_bbox_left(sprite_index))/10, (sprite_get_bbox_bottom(sprite_index)-sprite_get_bbox_top(sprite_index))/10, image_angle, c_fuchsia, 1)
		break;
		//ray masks
		case spr_atk_ray_1:
			draw_sprite_ext(spr_shape_square_side, 0, x, y, ROOM_DIAGONAL/10, (sprite_get_bbox_bottom(sprite_index)-sprite_get_bbox_top(sprite_index))/10, image_angle, c_fuchsia, 1)
		break;
		//default circle masks
		default:
			var size = bbox_right-bbox_left
			draw_sprite_stretched_ext((size <= 25) ? spr_shape_circle_small : spr_shape_circle_big, 0, bbox_left, bbox_top, size, size, c_fuchsia, 1)
		break;
	}
}