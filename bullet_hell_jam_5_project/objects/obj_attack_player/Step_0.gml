if (attack_active) {
	//find enemy collisions
	var target = noone
	for (var i=0; i<instance_number(obj_enemy); i++) {
		var o = instance_find(obj_enemy, i)
		//skip if instance is already in collision array
		for (var j=0; j<array_length(collisions); j++) {
			if (collisions[j][0] == o) {
				o = noone
				break;
			}
		}
		if (o == noone) continue;
		//set target if valid and vulnerable
		if (o.is_vulnerable() and instance_place(x, y, o)) {
			target = o
			break;
		}
	}
	if (instance_exists(target)) hit(target)
}