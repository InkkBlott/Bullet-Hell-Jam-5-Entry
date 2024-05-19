event_inherited()

if (hp <= 0 and alive) {
	alive = false
	death()
}
if (damage_effect_timer > 0) damage_effect_timer --
if (destroy_out_of_bounds and !point_in_rectangle(x, y, 0-out_of_bounds_buffer, 0-out_of_bounds_buffer, room_width+out_of_bounds_buffer, room_height+out_of_bounds_buffer)) instance_destroy()