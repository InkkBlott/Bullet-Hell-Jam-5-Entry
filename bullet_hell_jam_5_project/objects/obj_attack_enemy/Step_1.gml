if (mask_index == -1 and sprite_index != -1) mask_index = sprite_index
if (mask_index != -1 and __collision_size_init_sentinel != mask_index) {
	//sets collision "size" value to 1/2 the collision mask's smallest dimension
	__collision_size = max(min(sprite_get_bbox_right(mask_index) - sprite_get_bbox_left(mask_index), sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index)) /2, 1)
	__collision_size_init_sentinel = mask_index
}